Return-Path: <linux-media+bounces-63917-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f/OFLK7RImogeAEAu9opvQ
	(envelope-from <linux-media+bounces-63917-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:39:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C09648968
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:39:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TFpGJiUQ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63917-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63917-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A9413029E77
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F6C30C155;
	Fri,  5 Jun 2026 13:38:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394A72EEE7B;
	Fri,  5 Jun 2026 13:38:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666716; cv=none; b=AZjPMNI+d05xc/y8i2anZ6rtkGdRGNxQawNmvQfOhw4Aq/jezhug7+4/8LHkOcbeFtzpM+vquM45R0w9nB69B0dMfGOMXSsncx60W2EkPBMEWAQbG0TgUJ6ySMPYTFMwZLH99TDIA4xa7gr7T57eKW0fZlwA+kjHcpJNEhDjPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666716; c=relaxed/simple;
	bh=LK+3POW9/obNxVyGyc5XiVojVCcwLJ4eccFOKGaAx4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVOX1zqK/95mnViW9NySAHfTAmnyKrrrpw+2i1Rk3/l+Zalu3BCqtNaOo/x0b/oaSgFSN/nRWED0aaHMyJLURbIrFVpjiwif7Jx9cbyw37MKmyHTMyGGYq3dHiyq1P8QjZNmAr1/B8vzJEr0i1NlY+i/7Ej0ykMq/bdmW8KxOR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFpGJiUQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3511F00898;
	Fri,  5 Jun 2026 13:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780666714;
	bh=rfGnNvqCUgib40545imCPSY/SiAip+ywc+XcFOxOI1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TFpGJiUQQz+i0b3br3iLGiULHoktzvgA/vOxCTh6JcsE8+mIifU2kwKQWyRGgqRua
	 LLZzn0/DRP3ryRcJA9OQwh8JyL1XJ0/DD2KGXQP6A6SkSrGG+VtCbPsufd1Xd2RCWK
	 dUKAyKZb1Hy6Wg1HkoYfOxwtDtEWDfhO3bFOEB8JmjDpFw9QSNV4l2yMUyr2qn4D8r
	 t4K+81Od9uM9owP1jNEY9g/Z3vl8+dPJh7OwG56eivHeGLfGsfv9N/p+wWEKB+rQyT
	 8zvzaJ1EerhlnQGiwDifydpAQJk4FFo2sh1PiEwPn22cQMqukI6JbxECTCpm04mjpz
	 ol0d/TNMqVM/A==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 45FD5F4007C;
	Fri,  5 Jun 2026 09:38:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 05 Jun 2026 09:38:33 -0400
X-ME-Sender: <xms:WdEiap8kdWuE3YysUwdswOaPA4fijezl3rwvq8QlOJbI407Y7iXhRg>
    <xme:WdEiaqLy6oduWR1UbZXHhGEFv3SKo3dScTwQeFa3ivlNvYZva65JW4ryqNdWLdBB2
    u2xIuKLthdMGopom9GNHrzR2-GGe7qjH2s6hh3q5G2X909ZNk2b6g>
X-ME-Received: <xmr:WdEiauQlPSkr0f6mcCt8ZVO0VRvDXOWOWSL4iQVH4gpW39A2l2XGDL0Fg-w>
X-ME-Proxy-Cause: dmFkZTGM2UkizV+reMWXsdwOJhYIOL/j/0ZD8k5LsRt//sPW6kjaf/1MAAJ0mS4qvAWJgr
    15+ZE9Ned2LtlVaSIU/hTIK31lh/ZiF7B+6Dl48DgBzoVccKuJMd4aizR50L5yXembF5zd
    WRdevGEw5pSn1Aeg5KzCaeplPe5IioSwoezYandUOrmoD1L54WQwDc3vi5fY5g9Iz4hip2
    IA22r8289UO0Sed2c+lFj+GJ/uNQW+50/kDj0dlPgjjbwaStax/Dtg4Ihfe4AAFyy9lyV3
    ytF+09oOPt2XLy/4hGi7Rjmwe+luN8JXrhtMX41ZDdPdr5SUzyVc0wPipMuMMsFN/qP7l7
    1N1Asq6LYd4b2NYnEKOHrpCdd71edu6ZAcfpGU0H1c5F7kO0skdTw2HFVNQC5V5Wtsv7/A
    mjGkPdZn8zsr50HiI8y3gbLIByugJtC0+CMw1KPawpOrDQuIgPQP0pKn36hcgeSxWt0ipq
    We2x35EiJr+P3P6piUmIsF2X7uUWBDNUXdWacFNLBuO0yu7utV+And7dGk9pPqDzifAUN0
    RiAmGQ2yrbn+AiyZgtRwzPKQMKPTPRbN6wl9mC+kWELB4371sMo1QwziOH6wgU4UD8HCFG
    PIo0tJ78ajIuqt+xgU4MGlfE8jKMnAgGhIyxidGTRE8iECgahFadvJAwqEYQ
X-ME-Proxy: <xmx:WdEiaj8WmeIFPgDGITdJlJjt7rAzDJyOUtp-B08Z_iU3iUQXHiUIbA>
    <xmx:WdEiaud3In2TqqlhplDhtdilwE7LwfMwkrICvmEzG4iuj93y6rVxiw>
    <xmx:WdEialmO2nAv5kvLJs6v7Au4-SPQwiT0K1ugtd6k8bM4AlAm7yye4w>
    <xmx:WdEiariG4KWGWFJSC8B6SJFY-vm998RciyHDyrr6-VP8QN1brhiVlg>
    <xmx:WdEiavouDb2amznrBxATu6XcjzM16enOshIRh5SCy4H9n_dMCxHHJroI>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 09:38:31 -0400 (EDT)
Date: Fri, 5 Jun 2026 06:38:31 -0700
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
Subject: Re: [PATCH 2/3] rust: maple_tree: add load_rcu()
Message-ID: <aiLRV1UbaSYokAO_@tardis-2.local>
References: <20260605133541.22569-1-boqun@kernel.org>
 <20260605133541.22569-4-boqun@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605133541.22569-4-boqun@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63917-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,infradead.org,gmail.com,nvidia.com,joshtriplett.org,goodmis.org,efficios.com,linux.dev,linaro.org,amd.com,lists.infradead.org,kvack.org,vger.kernel.org,lists.freedesktop.org,redhat.com,collabora.com,onurozkan.dev];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tardis-2.local:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14C09648968

On Fri, Jun 05, 2026 at 06:35:39AM -0700, Boqun Feng wrote:
> From: Alice Ryhl <aliceryhl@google.com>
> 
> Now that we have a concept of rcu-safe containers, we may add a
> load_rcu() method to MapleTree that does not take the spinlock.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Please ignore this duplication...

Regards,
Boqun

