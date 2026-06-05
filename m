Return-Path: <linux-media+bounces-63916-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mcQOAdvRImoqeAEAu9opvQ
	(envelope-from <linux-media+bounces-63916-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:40:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDB164897C
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:40:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OG9k2hxv;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63916-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63916-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F43A3078E49
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627FA2EB874;
	Fri,  5 Jun 2026 13:38:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EBD247291;
	Fri,  5 Jun 2026 13:38:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666689; cv=none; b=hPGO5jPAMPr0vPw3q7xujKesrux8QeBSLMbbjYkt6jLtnJYjLVBahmbBCzRIQvsvdyr/3zp74DJSJDGmEDKmvJALHH+Bl6wruucJcSx0P6RpDddNJwiDRZkRqwFOfFZdX1X0ueqtbiuufxeC1TwKUyYeUhxMX2W8kK6M1g8VyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666689; c=relaxed/simple;
	bh=2HY1VrKJWEW4+NSh6ZvKwrRj/OE0I9NtQOFkWKOTyd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAGVkMYOP/16WdVtCjCf3hUFzTQBrGjTNwDH5ks1H9jPeJtmRih8zr4ZgKKSY9LnOr3lq6QaWI/Bc4D+/oWutTAhqqzey5jf0MdtDGhng457eITwnfxscB10a6Uot21Smtl76kcwLHQIA95ae/DLb44pK7HnnabWrczwl92drMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OG9k2hxv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A46A1F00893;
	Fri,  5 Jun 2026 13:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780666688;
	bh=aUElHjjSr/wCG09eJuAWs4nSH4fgcOTWg+17svsiIlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OG9k2hxvR7H2l3Di+gaBO9Fb8HG8b8OClHLonP12Pco4CU2InrbxU6oKfTgPHc3Yf
	 R0RxTjGZvVVsyHPCEZAUb2ZooIcRogCXWwZ+4IizG/D45HB4YLFrgPwCfq3ifdxfF1
	 GEZX/hDzzIjra+QC0+mHU/nF0vhDm4MrhG+X2yRmmeoeF3EZMhXqCjKdfX14WMiq0Q
	 IHNE5HuVOuLyeyGDjFHTdGXQQEd51QZa7IWb/aYV9lMjkS4LissMYQItBUl6nuRfjV
	 2u4EIY9Gtwe1NwqtM4TBoWF4rc8OJYtgy+ib6ebNdAqqR75H0UVhSFvf60EBJKQz3e
	 qZQPS9CqZXJqg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id E1F9DF40069;
	Fri,  5 Jun 2026 09:38:06 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 05 Jun 2026 09:38:06 -0400
X-ME-Sender: <xms:PtEiatK6eLii7KziBaBTT8wjRaVWmcjLxXTg6xUvAOnv2sFTLGq5eA>
    <xme:PtEialm4ZzymOsemKfvmeIS0Gr-Ca3sAfyuazH0pkyee80LMDt3rzBkSQnzegHoqN
    XlQqG-Ac7dCnEukcYvf-nwTQUobIsaEP_LSFNJzDb-28Vblqycsow>
X-ME-Received: <xmr:PtEias--sxLWQymblUXu_M6gKU8ZmrKVjAysmr96GKYhelqxwByh3SmIPto>
X-ME-Proxy-Cause: dmFkZTGM2UkizV+reMWXsdwOJhYIOL/j/0ZD8k5LsRt//sPW6kjaf/1MAAJ0mS4qvAWJgr
    15+ZE9Ned2LtlVaSIU/hTIK31lh/ZiF7B+6Dl48DgBzoVccKuJMd4aizR50L5yXembF5zd
    WRdevGEw5pSn1Aeg5KzCaeplPe5IioSwoezYandUOrmoD1L54WQwDc3vi5fY5g9Iz4hip2
    IA22r8289UO0Sed2c+lFj+GJ/uNQW+50/kDj0dlPgjjbwaStax/Dtg4Ihfe4AAFyy9lyV3
    ytF+09oOPt2XLy/4hGi7Rjmwe+luN8JXrhtMX41ZDdPdr5SUzyVc0wPipMuMMsFN/qP7Y4
    vlvWIn4oKFFs5cDfKtpLIOpgf0tvY+jUlf93fzbNnDt/68bk08iWkzm7a9LZAXFi0jcjja
    anStgXfOiYQc7NykiIvESKjdbaAXID9EkTiRRiWRazyjO7ppNO+ohdQu+2KGRK1Ci0Yy72
    u53VtHJSqNlNswggi6/fGyg+BW1RItpPEyNZR3/EAnYagL4E3XpEuPq5mK9lPEUG7lm9rU
    W1v3pmB/5ZQjAjGPD2kDPlrHwv57tADfi7fYLHCdP5sqxfxbTrepoQxetAxKlCQvqLgiy+
    rD6Re6dvHNNw2pbagIyYAr/zUHrG7mA5sTaFd93oywdG8moYw+mbia+m4AXA
X-ME-Proxy: <xmx:PtEiak5UH5o2U2bQZ6whoDhkH6AfADeDIOpZuV26jyf4VZLbvvJGYQ>
    <xmx:PtEiakpe4HQpkkrrqd7v3fu_o0beu-hZzcO7RbSBSXe2jVZrdX3xRQ>
    <xmx:PtEiaoCY9saDv-squihWfpTXi638dd_gwAadllMsnpKtunPHWfqOhA>
    <xmx:PtEialPj464sUHdR_5m-FdX7cd0CBs_DHCoUCnQ2LeoxYcQ0AvbLMw>
    <xmx:PtEiavnekmERjw_NDs5-r3W_q4_Gbg9GasfZUCgXgpghQvfc6CsXkau3>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 09:38:05 -0400 (EDT)
Date: Fri, 5 Jun 2026 06:38:04 -0700
From: Boqun Feng <boqun@kernel.org>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Andrew Ballance <andrewjballance@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,	Zqiang <qiang.zhang@linux.dev>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	maple-tree@lists.infradead.org, linux-mm@kvack.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH 1/3] rust: rcu: add RcuBox type
Message-ID: <aiLRPNuS9hDMVUJc@tardis-2.local>
References: <20260605133541.22569-1-boqun@kernel.org>
 <20260605133541.22569-2-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605133541.22569-2-boqun@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63916-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,infradead.org,gmail.com,nvidia.com,joshtriplett.org,goodmis.org,efficios.com,linux.dev,linaro.org,amd.com,lists.infradead.org,kvack.org,vger.kernel.org,lists.freedesktop.org,redhat.com,collabora.com,onurozkan.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,tardis-2.local:mid];
	FORGED_SENDER(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:rcu@vger.kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:liam@infradead.org,m:andrewjballance@gmail.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:maple-tree@lists.infradead.org,m:linux-mm@kvack.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:phasta@kernel.org,m:lyude@redhat.com,m:daniel.almeida@collabora.com,m:work@onurozkan.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CDB164897C

On Fri, Jun 05, 2026 at 06:35:37AM -0700, Boqun Feng wrote:
> From: Alice Ryhl <aliceryhl@google.com>
> 
> This adds an RcuBox container, which is like Box except that the value
> is freed after waiting for one grace period (via {kvfree_,}call_rcu()).
> 
> To allow containers to rely on the RCU properties of RcuBox, an
> extension of ForeignOwnable is added.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> [boqun: Make RcuBox generic over Allocator and add tests]
> [boqun: Add type alias for Rcu*Box]
> Co-developed-by: Boqun Feng <boqun@kernel.org>
> Signed-off-by: Boqun Feng <boqun@kernel.org>
> ---

Please ignore this duplication...

Regards,
Boqun

