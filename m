Return-Path: <linux-media+bounces-62345-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MFvBNLwDWp+4wUAu9opvQ
	(envelope-from <linux-media+bounces-62345-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 19:35:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE82594051
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 19:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1266E316772E
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 17:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B4E35AC18;
	Wed, 20 May 2026 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="KU5B8iiW"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A2347512
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297499; cv=pass; b=JNHP/KKiWZOVXRpggvQcRt9uNLQbE6HWeIIPmEaaK64QpYL6sT8/S0OPEJE863ulm9165B1V3xpJM3auZw+B1X2bujtsJtGHYG1Nm0ip3qLeHoOplaXQn7HcggY+j0Tp6xlYP5t4rWU1xng9ewJbVU+e9Qtt8+6Q0CXzk9sousE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297499; c=relaxed/simple;
	bh=x0Gm/7aR3SwyPqKUl63CSm271ggja1JFDvDWibYK4ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DqxgsXgszJWILMt7r70VAoSWxWRzzDtB3Z4cLY0tBGxXkElaYe5Nr23uMNngG3qPmVnYvjElHQWdghEtpOTloRq9ReBKUOKnQM17XOL+yvN6XxRnL/lddZTdEJJ23mmGp67NN4dtPBtOdfBx86GJlFZCdUL4wIgusmfvwOtuE6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=KU5B8iiW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779297488; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=csS68DZzvSHu5gw7WMKqVFQxaoX1AuHVDHCGdxum/O74zC3ZfyqzU8+ceCIWbSZAT9ArebEWTTrxxiVExYurVpF7f02nuwFAdlosqErCniML1bwLFLioBHtVN6tMBdAUdc4z3fc/nj7BXkNUh8Sd/htODgX8u98S6MU3Y3s/JKI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779297488; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NeBwgyjZK25hQAT87Hew+crfp0Rqyjwr0cIr0wqwf44=; 
	b=PWlGSxANwL5uhStuHeoVZT2HYxWUeHNGQ0sRl7LFANDsx2VTvdobddyYKyzp91wT13aPstBr1DdwO6ryGXQcrViyLboU8N37PP34EKW/4nhZTHZnM80V8XrXk85vuvUxR8w2iPPvECNqP0s5y8npJBGZ+EZE6Je47bvCy8It6so=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779297488;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NeBwgyjZK25hQAT87Hew+crfp0Rqyjwr0cIr0wqwf44=;
	b=KU5B8iiWjz18uha7sJPTtOHXqTABo34Ham0Cf7HwJ83WtcSOu/E6xZaWyXprIKPR
	r+Bpke6scgdHD7DQAWs6xamTSKgEjEjRNlROwPMI0tvEpUp4NkvJDkDJpixO2ptBTBy
	BqOdA/8Z6DSCzVE1y+5uk8kMJw4Hw7jbzRWOBLr4=
Received: by mx.zohomail.com with SMTPS id 1779297486565731.5417719790839;
	Wed, 20 May 2026 10:18:06 -0700 (PDT)
Message-ID: <e3b93bda-fed8-4f21-b3d8-cdf28bfaba1c@collabora.com>
Date: Wed, 20 May 2026 13:18:05 -0400
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
To: Simon Wright <simon@symple.nz>, linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
 <5797ac61-dc61-4182-ac60-cc377564ff90@collabora.com>
 <2565c949-a558-415f-8c79-e47812db8341@symple.nz>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <2565c949-a558-415f-8c79-e47812db8341@symple.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62345-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6AE82594051
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Simon,

On 5/20/26 02:45, Simon Wright wrote:
> Hi Detlev,
>
>> We do not have documentation for this decoder, but could you check
>> your decoder version ? It is store in register 0 and I get 0x38321746.
> readl(0x27b00100) reads 0x38321746 on both my RK3576 boards:
>
>    NanoPi R76S (FriendlyElec):  0x38321746
>    ArmSoM Sige5:                0x38321746
>    Radxa Rock 4D (yours):       0x38321746
>
> Same silicon revision across three different vendors' boards.
Good, that's one thing less to worry about.
>> What I don't have is a test showing that the hardware behaves
>> properly with the vendor driver.
>> Is that something you could try on the NanoPi ?
> Done.  The R76S has the FriendlyElec BSP on eMMC, so I booted from
> eMMC (kernel 6.1.141, MPP c1f1c12d 2025-09-30) and ran
> mpi_dec_test on long.h264 (1920x1080 H.264, openh264enc SMPTE bars).
> Then rebooted the same board from SD into Armbian 7.0.1-edge-rockchip64
> and ran the same file through v4l2slh264dec.
>
> (Armbian's build of Linux 7.0.x carries one unrelated rkvdec.c patch
> that removes a vb2_is_busy check in rkvdec_s_ctrl; rkvdec-vdpu383-h264.c
> is byte-identical to torvalds/linux master.)
>
> 10 frames of NV12 vs an avdec_h264 SW reference:
>
>    Board         Kernel + driver               Frame 0 diff
>    R76S          6.1.141 vendor MPP            0 / 3,110,400 (MATCH)
>    R76S          7.0.1   rkvdec-vdpu383-h264   732,094 (23.54%)
>    Sige5         7.0.6   rkvdec-vdpu383-h264   639,721 (20.57%)
>
> Same chip, same NanoPi board, same input, same SW reference.  Vendor
> MPP produces bit-exact correct output on all 10 frames (0 differences
> on every P-frame too); the upstream driver corrupts every frame.  The
> Sige5 line is a different vendor's PCB on a slightly newer Armbian
> point release running the same upstream driver, included to rule out
> a NanoPi board-specific issue.
I also have an Armsom Sige5, on which I can't reproduce this either.
But it is a good thing that the vendor driver is not affected, it also 
rules out hardware issues.
>> The other report also mentioned that the issue was happening 10%
>> of the time, but you seem to see it every time, could be nothing
>> though.
> 100% here.  Every frame, every test stream, multiple input sources
> (openh264enc, x264, NVENC, QSV), two independent V4L2 userspace
> implementations (GStreamer 1.28.2 v4l2slh264dec and a hand-written
> Rust submitter).  Rows 4 and 12 mod 16 are fully corrupted every
> run.  The exact percentage drifts (20.3% in the original report,
> 20.57% on Sige5 today, 23.54% on R76S today) because freshly-
> generated streams have different intra-prediction modes, but the
> rows-4/12-mod-16 pattern is invariant.
>
> I can host the long.h264 + sw_ref.nv12 + hw_bsp.nv12 +
> hw_mainline.nv12 bundle (~115 MB) on a public URL if it would
> help your reproduction.  Also happy to dump more registers,
> instrument the driver, or test patches you'd like me to try.
It could help to use the same input file as you (maybe different version 
of encoders generate different files).
But the output files won't be needed.

Another thing that could be helpful is information about BL31.
Which version are you using ?
Can you share the bootloader binary you use on the Sige5 ?
Is the vendor image booted with the same bootloader as the upstream one ?

 From the serial, on my sige5, I get:

INFO:    Preloader serial: 0
NOTICE:  BL31: v2.3():v2.3-859-gc481e5368:derrick.huang, fwver: v1.14
NOTICE:  BL31: Built : 09:37:28, Nov  8 2024
INFO:    ext 32k is detected
INFO:    SOC (0x35760101)
INFO:    spec: 0x1
INFO:    soc cold boot
INFO:    ARM GICv2 driver initialized
INFO:    bypass memory repair

Regards,
Detlev.

