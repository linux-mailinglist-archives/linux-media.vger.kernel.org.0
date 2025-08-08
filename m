Return-Path: <linux-media+bounces-39123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B653B1E88A
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 14:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77CCF188A3B6
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 12:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A992797AD;
	Fri,  8 Aug 2025 12:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="p1xoNIhX"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764E81CAB3
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754656955; cv=none; b=eLRATZ/WNknicmn5KxgHbAMsSVOTBVKT+n9zaDifP3aEYuObulOab60NOcp5/36j/XuGZV7lPqCspZs2CFKBmnQU97hwsyUQC3DnC6HQmVby4JLm4f+lnjq8v9WNHJFdeBb3ayyXIe8rSsSE1+CnutG1vsugGigOpvw+DxHbPkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754656955; c=relaxed/simple;
	bh=GLRtfRJ+I4rMNFVF9Ue+eFPSyE+Igc1i51sjeUBEhs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWgDz3/CIcEFCgVs6sfT8VXwXIhTwFTQJdMvO7zeeNYvtOipCV1SMooX7PJEz69oVASw3ExZ1luA9WGoyeY+Krf99rI6gu5AY6gIh/QjYv+jkDwvDuoPPMpXgGdE8DoCjuQbdeJFFI0SGmkx9isRoX4HeKUYkB/qR5PlL++zDRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=p1xoNIhX; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1754656946; bh=GLRtfRJ+I4rMNFVF9Ue+eFPSyE+Igc1i51sjeUBEhs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p1xoNIhXRH4aIBoyyLu0HKAwODs4Ez5aZ01ApHyo0Kzoo6ZqafceIC8GRiJz4NBjr
	 YJLmk0RdKDSWBDBtTCCfVyBK/a0CK/2mCgm40i4wVotr5Uyp7gEHnIJ29w36n8cKCX
	 2CjgttKfTMSZ8YKZC3GlDmVMeMY4j8NKWrR3Svj3UsPFKaZVh/saVXI1BBOFBdFSjQ
	 abmTLBupRAi/ci8ZmIWeiAilF5W+++1yQLZROdx0/GVG+K6XY5RLwBa5Ia4NSPRpSE
	 5C/TAoVrRncAqa9Gw2aMLmhl6x032jyC8HMObbXSgoVWHPL0Jc7bCtYLAZ3gMe+EQn
	 B5lmBDEPLZ7MA==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 4DA95100090; Fri,  8 Aug 2025 13:42:26 +0100 (BST)
Date: Fri, 8 Aug 2025 13:42:26 +0100
From: Sean Young <sean@mess.org>
To: Sam James <sam@gentoo.org>
Cc: James Le Cuirot <chewi@gentoo.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH] meson: Allow BPF code to be built with GCC
Message-ID: <aJXwsll4gi8W7cTw@gofer.mess.org>
References: <20250803081759.13952-1-chewi@gentoo.org>
 <aJB5rmwRfiYv7sJb@gofer.mess.org>
 <aJHr3EZj22gDDIAH@gofer.mess.org>
 <87y0rxyfnj.fsf@gentoo.org>
 <8734a54cx5.fsf@gentoo.org>
 <aJPAsYVyCqxmwxDg@gofer.mess.org>
 <87bjos17j8.fsf@gentoo.org>
 <87ikiyzk2i.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikiyzk2i.fsf@gentoo.org>

On Fri, Aug 08, 2025 at 02:19:33AM +0100, Sam James wrote:
> Sam James <sam@gentoo.org> writes:
> > Sean Young <sean@mess.org> writes:
> >> The problem is that gcc compiles this down to a lookup table which is then
> >> stored in the .rodata section.
> >>
> >> https://git.linuxtv.org/v4l-utils.git/tree/utils/keytable/bpf_protocols/imon_rsc.c#n97
> >>
> >> Then ir-keytable fails to load and relocate the rodata section. Note the 
> >> error:
> >>
> >> symbol  has unknown section 6
> >>
> >> section 6 is the rodata section.
> >>
> >> ir-keytable simply has no handling for .rodata right now. I am not sure how
> >> bpf handles .rodata (if at all), needs more investigation.
> >
> 
> With -fno-tree-switch-conversion, the program loads for me.

Yes, that works. Let's use that in meson.build.

Thanks,

Sean

