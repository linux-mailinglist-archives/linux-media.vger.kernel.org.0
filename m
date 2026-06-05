Return-Path: <linux-media+bounces-63923-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lLcyK+7XImpTeQEAu9opvQ
	(envelope-from <linux-media+bounces-63923-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:06:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A7E648B6F
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 16:06:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BFJnrfEU;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63923-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63923-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C9E302E92B
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCAC33F8A1;
	Fri,  5 Jun 2026 13:58:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DBF33A9F3
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 13:58:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780667912; cv=none; b=B488d4op6EWBzdoX6sIIaIp9duflmOguBqPEw9o1lM8SWxrDjJSIy6VUzIvTwHmjwz6QTQYi8GO9F9JKb1nAv0DuHmsOjk/Z7gkBzoW/bT57YS8qal/Bp3Ob3EhdAiZwUrPru6Mo+5qIttgyMmP5IQ5NAbWTuUM1dw7XmUmXcvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780667912; c=relaxed/simple;
	bh=3XBWY6MMPZ6f2vfP73CVGG6zmnJNFrkKpcwnUc4yDZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3fv3d5gh3tovXNyYRqdpa9q6IR3ZIiRxhU/yz69Xx9FKlRpWSeiLW2/I1xR8ZN7a9JGo/tEabrn4cGANlEKgZqHza3BxBpsuWKTAx3MrXyn8ADWHh04ekHUgQGr6CSNlthuvvYDZ0biA0fBrvBV+Q7Pxyfmw5Kwd/OMediVmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFJnrfEU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD6D1F00893
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780667910;
	bh=Q885mhCv0lIPD60VFH3SrbDmv8DP44ATAyk0g8vyOIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BFJnrfEUeeqZ1RZ3Ul1PU1vuT6YpuWJi4TvxTRGDeHBmReq4769cYkueRrFA2Ezqw
	 XoSwCrYHHOB/enzwzMOtgM/dZfneUZmNySFCpwIVMCmTzOUJ3yj44anGv0+vgq9WTk
	 c1cNcP+f0YMbtlEzKcShPPpXtBj7JItoul0KGvdDLntCfjYyTkCiV4I5FjfEeTeCtE
	 vfiE0ISq18u+vnWQOxm9qiEq01SMiBfSQv0hiyfNVO842opi97J5hXNrBKKGq+11ml
	 pOpGN7BW01hU5uNUoDcE55FV6AF4tt2NC9aC/aI2wugrvO2Zcf4fjbX2r1YDkz/WH4
	 9Yvd7M5qSy3kQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id BEBE1F40081;
	Fri,  5 Jun 2026 09:58:29 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 05 Jun 2026 09:58:29 -0400
X-ME-Sender: <xms:BdYialzhV6KiM2N-ripSx4Ts3VydALqXnlHAG-cB68omg1IZyN8rVQ>
    <xme:BdYiauP1r6B4t8sge-RESH7li-TZKsapqOPHmty-_-C6MQY7ZbylUYQblv6UQOUOH
    -SnijHae-UYyedvQGzoSoUlZw_aK_fy6fTqTKY382AhRtAgj-i9dw>
X-ME-Received: <xmr:BdYiaq7rUl9oAJ1dreslzcRdEsyOH6VtQx2yKX__PYBzDu6N5wVN3olmsho>
X-ME-Proxy-Cause: dmFkZTGaSo7q4H7+bMA6ihnLQtBdT9xCwaWwGm0m9NWD4XbkJYiP2HHuhlBeMmscxt+LX7
    AgjNs9tdqamSEr20FWQv7TM6WxDP45fu+Va3WXZkbPXtP3t24wMICWWQ81RemQ26NKJx6H
    qeXbzzwuSgGAlKEhwLWjqlmQ1o7GFDVZ9FYhNp/6oo4D5Id27FHXJzLjJtH+Fy7Z4vaiBy
    xPGkSIBby0cGeUCWDOAynVpTTZ+qafifdbIupTJU1x24504y6qGygDSWKS740HrnVTLWp2
    iuEp6Gd+Cx4xr5Q2nerY3VdXxugbGnPvuSVawshoAbjl+4gTu2XfXxNCfYdZRwF+zJ4kiH
    mWuja+cPEJ6mqr05UJ+dyja/1qyKyJQAQC09a3i7BFZS0Jd5hG5gNbbo36L6dVE9L1A92g
    xmBPnfnFT9T5YdJDy3nkQLRuBYd3mFamqrec58fcIViXCMWYvoB810p4JEKWLU+sJh0DPi
    q1SpIgTcH0luyqoG0g+N+P8zHWiWOBwfF4brQFAVW9t50MnHY2Lvdi5mAHR1VlAwQDkEN9
    bjzrEqQNiWbHsfLDvDjvmZ8Jxb5ea8kqBJRdnjs5OX/k7OcYZzQwDI5li6IbcZnERy8Pia
    4mZGwCHYtNaaXHxOcPuaKuTcYc4oyaidKpqydcXN1AQKunK/JqDXbthRYcZQ
X-ME-Proxy: <xmx:BdYiannu5TVtKeoWOeolOWfSPbwzoooOYg6MIpkoinV3CSSpcCVYqA>
    <xmx:BdYiajSadpVXmaj599wn5ev4v66n-is06KcPapai76N8M-vSviBmqA>
    <xmx:BdYiauHP51Vh0kIuyAq_VE-gW_jluylhACQCUXDfSh9vFNQyyx9x9g>
    <xmx:BdYiagF4WQBzsD0H0vZSPGhOqI76irp7BXt_QtDjUjWpHJpSw_-jyA>
    <xmx:BdYiakQdBZZj4KLYK7d3oAFhWfmZD8A6Gute7Dak5RPYs95x5vAb38lh>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Jun 2026 09:58:29 -0400 (EDT)
Date: Fri, 5 Jun 2026 06:58:28 -0700
From: Boqun Feng <boqun@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 1/3] rust: rcu: add RcuBox type
Message-ID: <aiLWBAE23BtXzVIU@tardis-2.local>
References: <20260605133541.22569-2-boqun@kernel.org>
 <20260605134935.B6C0E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260605134935.B6C0E1F00893@smtp.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63923-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:ojeda@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url,tardis-2.local:mid];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boqun@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06A7E648B6F

On Fri, Jun 05, 2026 at 01:49:35PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] RcuBox::into_foreign drops `self` instead of forgetting it, causing a guaranteed Use-After-Free.
> - [High] RcuBox::drop bypasses the custom Allocator A and hardcodes kvfree_call_rcu() for types that do not require dropping, causing undefined behavior for non-kvfree compatible allocators.
> --
> 
[...]
> > +
> > +    unsafe fn from_foreign(ptr: *mut c_void) -> Self {
> 
> [ ... ]
> 
> > +impl<T: Send, A: Allocator> Drop for RcuBox<T, A> {
> > +    fn drop(&mut self) {
> > +        // SAFETY: The `rcu_head` field is in-bounds of a valid allocation.
> > +        let rcu_head = unsafe { &raw mut (*self.0.as_ptr()).rcu_head };
> > +        if core::mem::needs_drop::<T>() {
> > +            // SAFETY: `rcu_head` is the `rcu_head` field of `RcuBoxInner<T>`. All users will be
> > +            // gone in an rcu grace period. This is the destructor, so we may pass ownership of the
> > +            // allocation.
> > +            unsafe { bindings::call_rcu(rcu_head, Some(drop_rcu_box::<T, A>)) };
> > +        } else {
> > +            // SAFETY: All users will be gone in an rcu grace period.
> > +            // TODO: We are luckily since `kvfree_call_rcu()` works on both kmalloc and vmalloc,
> > +            // maybe a new `Allocator` method is needed.
> > +            unsafe { bindings::kvfree_call_rcu(rcu_head, self.0.as_ptr().cast()) };
> 
> [Severity: High]
> Since `RcuBox` is generic over any custom `A: Allocator`, wouldn't calling
> `kvfree_call_rcu()` here break for allocators other than kmalloc or vmalloc?
> 
> Does this need to always route through `A::free()` via `drop_rcu_box`, or
> should `A` be explicitly bounded to an allocator trait that supports
> `kvfree_rcu`?
> 

There is a "TODO" here to describe why currently kvfree_call_rcu() is
fine, is this a real issue in the current code base?

Regards,
Boqun

> > +        }
> > +    }
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260605133541.22569-1-boqun@kernel.org?part=1

