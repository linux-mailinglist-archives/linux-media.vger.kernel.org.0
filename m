Return-Path: <linux-media+bounces-63910-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pZ9HD0LRImoNeAEAu9opvQ
	(envelope-from <linux-media+bounces-63910-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:38:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A588E64891C
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:38:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ix0DkSQm;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63910-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63910-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A73FC300D734
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53EA30EF90;
	Fri,  5 Jun 2026 13:35:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A988730569E;
	Fri,  5 Jun 2026 13:35:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666552; cv=none; b=SHu03CuyXDJWSN0mKyZYLPp4Rewe0pSZ7x1z9Px9BNE9m25aE9O2j31rOH/TMwD3FzNq/9ptMKOLCpYVpNe7T6zcJIbRtmpeWkP8thE4NUxlySUmBLF5T4l0zNiLOiD80ldPp7oMyNfUk5pCe2OeT0tiKQmMdGM5BJQvnt5KQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666552; c=relaxed/simple;
	bh=UUhxtcNBQidBPnhJq9akfhz+nsSIhTWipy6zveKmyyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iBycQv82y34/ORcBOLwZq9hBt4L/39XyJG6grxjas+Zx47yw1MoxOHQKby0rNO1WwtuFpZB+bn0/kilX+Ju2nmE1URnVS0SRm6I+0PDRC52/AEdbWezD8C7VJat0rFAWgvoUXPa9P1mMBV/oWzv/164uR3AeIHG4QAb9d7LswYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ix0DkSQm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D4E1F00899;
	Fri,  5 Jun 2026 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780666549;
	bh=V+3GJsZxiITcRMlzwywosE1kBJjYYPTTK69C+X92Rrw=;
	h=From:To:Cc:Subject:Date;
	b=ix0DkSQmUGurOTrxvkWU7LOARXXBDSkm795E34/rofpJEaIVLHvoilfrBKuy8IG/y
	 tVWylKmQxvjuDwM5oab0kE+V+t3esDnq9QJlPNhHH5HWipiFXxBPTa8a4hfr2KzMDd
	 RAnh2YkQ/2uI13MwrEgi11yDrZiI/Xq+CB5eKL0xPYpcnB968/m+8lv4f/XBFyoKaw
	 J4br78NOtXfKDQYWJRTZ6EtuZMglshD1aA1MqfH1rbnRycup5iAOBHXh2VAAKtG3SJ
	 FCsmX4njD1QrkIvji3K1JGDV5nsonJy7CN4klFGZj2BrmfEJLj+IkDSoYuy6cKy//E
	 ZtwyGIypkoEig==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5B751F4006F;
	Fri,  5 Jun 2026 09:35:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 05 Jun 2026 09:35:47 -0400
X-ME-Sender: <xms:s9AiaradpzQawOzKlJVdLrR4MQLkpLTE_FbiMrwK4PtwHVH_Qy5Vrw>
    <xme:s9Aiam0rZx6Vqij-n0XJQMXbyll_Wv18_UYjL5Pc6oD_1DKFgEun5JsmkyKRsLgDF
    ba5z_9a237nYuDO5K7KEU1zrsxyLGKSA93STKOyVKhnUnNCZXk-JtQ>
X-ME-Received: <xmr:s9AialO2SzzCUNoUPS8MA78Q6f4GJkThBBPf1nyzR7DSTjOoRX4s-kHFkvM>
X-ME-Proxy-Cause: dmFkZTFKENnCiyPS37jOfUW/oSt3ApI4Om6wyeJiiPYsBRF27Y77NEp2GRWEH/Wu22F/nN
    jSLPXUo+vpn9G/MZoMnCSmi/RsIDJMGfJOTTMeMH880odghXtGPynqv6EEGLiWUW12Ktmf
    F+PPRU0YRdVUAi+LO4dYxUc0b6J0tg7+Juur2hWdNU+gehj5U/NdtzZkPNhXPF4Ah90viD
    aqhiOSGPff6V/LBAdW9kqJklU4xsIoTyQSGu0+i9A580vKQSwad1R6zoD1RnChJ5FNQ0dU
    bczE0+CcxhZJZhPPbEA3Zn2zVHH/I+liU4sR06uQjZ7j0Fz1fxA7p/zOJ9UaIcNU9giYU4
    XnFhxWfhVpmI0x48ilXTpAWnWZJOWYHCRkUPVu8DzmXQd2Evddhunr9+jUv3n1xsRGUJ1h
    KQmDvz7AHx4jreqF+CU8EJa22nDQZyEc9Isrzx55OoJPiCds42Ma8cXKeCFslYjHG0g2UR
    m6MN2ENP/0QYdd3tNgHfqUXI8s9lbQEVkiZm7rEvQKJcZd9JW2V8zNmSlmmZOl++/Hc5au
    +QVxNWcUjE7N0iLrQMQT9DTEs0O5zHvXQelb/HgeoOaRMTqiwWdtOm48B35HA/2VcP5yvX
    S1vKc1wSal6Sc4eAgayfqjlzetTHUH/A4qSt4sbZEumI7lZ7JRGIbnYqaGjA
X-ME-Proxy: <xmx:s9AiaoJP5H1mQq9mKqc22IPHCNQuAKSzFAZYMeMiGwLs8-ig5fL5Hg>
    <xmx:s9Aiam4LYBXuxb1CczLm-kQ0FUaaSPEcwlsLr9L1gFUdmjctsaDyDg>
    <xmx:s9AiatSoEaiQxwJIDLjzp4xVMegWPQ5UQXM7aeL9Vst0yqyTkKrP3A>
    <xmx:s9AiahdPhb1tKWWG_57IHXbjRJhH6bbERiKFH42OtQjaSz7OoEZYxQ>
    <xmx:s9Aiam3Zz_OY6OnrU-z3FXeMx44yzRAihPGnvnLADD9yX_TAyGAs9s8j>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 09:35:46 -0400 (EDT)
From: Boqun Feng <boqun@kernel.org>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,	Trevor Gross <tmgross@umich.edu>,
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
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	maple-tree@lists.infradead.org,	linux-mm@kvack.org,
	linux-media@vger.kernel.org,	dri-devel@lists.freedesktop.org,
	Philipp Stanner <phasta@kernel.org>,	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH 0/3] rust: sync: Introduce Rcu*Box
Date: Fri,  5 Jun 2026 06:35:36 -0700
Message-ID: <20260605133541.22569-1-boqun@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63910-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,infradead.org,gmail.com,nvidia.com,joshtriplett.org,goodmis.org,efficios.com,linux.dev,linaro.org,amd.com,lists.infradead.org,kvack.org,vger.kernel.org,lists.freedesktop.org,redhat.com,collabora.com,onurozkan.dev];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:rcu@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:liam@infradead.org,m:andrewjballance@gmail.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:maple-tree@lists.infradead.org,m:linux-mm@kvack.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:phasta@kernel.org,m:lyude@redhat.com,m:daniel.almeida@collabora.com,m:work@onurozkan.dev,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A588E64891C

(this series is based on Alice's RFC [1] and discussion around Philipp's
patches [2], [3])

As an easy way to provide RCU-protected allocation, two major types are
provided:

- `RcuBox<T, A>`, inner T will be dropped and after a grace period.
  Users: binder with maple_tree and dma_fence.
- `RcuFreeBox<T, A>`, inner T will be cleaned up immmediately and freed
  after a grace period. (Name suggestion is welcome). This is an attempt
  to consolidate Alice's `PollCondVarBox` [4] into a generic
  implementation, InPlaceInit support is still missing, but I want to
  get some feedback on the trait `RcuFreeSafe`.


[1]: https://lore.kernel.org/rust-for-linux/20260116-rcu-box-v1-0-38ebfbcd53f0@google.com/
[2]: https://lore.kernel.org/rust-for-linux/20260530143541.229628-2-phasta@kernel.org/
[3]: https://lore.kernel.org/rust-for-linux/20260520131725.266014-2-phasta@kernel.org/
[4]: https://lore.kernel.org/rust-for-linux/20260523-upgrade-poll-v4-0-f5b4c747eac2@google.com/

Regards,
Boqun

Alice Ryhl (2):
  rust: rcu: Add RcuBox type
  rust: maple_tree: Add load_rcu()

Boqun Feng (1):
  rust: rcu: Introduce RcuFreeBox

 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/maple_tree.rs       |  52 ++++++
 rust/kernel/sync/rcu.rs         |  65 ++++++-
 rust/kernel/sync/rcu/rcu_box.rs | 290 ++++++++++++++++++++++++++++++++
 4 files changed, 407 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/sync/rcu/rcu_box.rs

-- 
2.51.0


