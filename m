Return-Path: <linux-media+bounces-22067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A76719D9316
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 09:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E05B283C01
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 08:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269CF19995A;
	Tue, 26 Nov 2024 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="FVKh36pG"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9E028FF;
	Tue, 26 Nov 2024 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732608584; cv=pass; b=sbUculLRq6Orw+fkDEnPG0bwiLrAG/odrNp04+ZOYYC+0rp6DA4G8I7qEq+sLtKHofuYzNqIsDyiJhcDm5bH3ah1KVqiRgzG2/Zrr2QAlT4B0Jyq2Y2u0pM1IWfWKRk9Uz3jhONkdrqhshWLA69VJuIot0yFyahAaJLScmMB+AU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732608584; c=relaxed/simple;
	bh=s07l0UWvSUPAcdJPP8adSOK5H+t+E7TxefBo6lU5TYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3VF43Y6sOAKXdr7nVq3/evTo2vDU51AIsCjPC3abInbHzNc2A7FPIvRiXv/sFmWOaCmx1NeRM1SQv6p5yp12BT2WYH9LkoGP0U6uOv77Dbd/Y7BWscq9xueiSdqcwLdWqfe9ifjM6fKDa0zfss9EExreTeqPqB46bBcLSAMMHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=FVKh36pG; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1732608566; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UUMs9DzPOh92WAVptpc7fklDwSpYO/TrUN/8FAR0Djo2nfcNMPaQRSdoLMJA3XtNNc0lZgZvPkVFFI1jnF98H7X5txsM/buhRDtcANS7f94PKwFYP0cOX3amtEZXQ86P6jW0ldwm1L4mX8EErEMXUdS+GR79rTbbjpt6sVLgZZ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732608566; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5gcpd1uwGRP08Kiq7/gE67RsnGAnScrjwH6l5y2hLSE=; 
	b=JYARbxfqORjSN8B5C5hdOFJjNNiRNdOFjXsD/CIXIXW9udLZq7Gr8/AdUxU674G+r/ubwEoHvgyVYHhdCf8gJHCCqEiW4AkAJ79LpmWllcrIsoa5NmGTvgNC2CDlaSQONFnfB9GQOb5Uq62sY2Xw2CZ96G1c0h4eTvM3DdZT+EM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732608566;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=5gcpd1uwGRP08Kiq7/gE67RsnGAnScrjwH6l5y2hLSE=;
	b=FVKh36pG0SqUAC8KywCh/wPuuFyQRpmZyLflaRkOL0n+4GyNGrri9DMDGt4Aq6hC
	xEQFWXLPl15EV2qhVPE3hnHBX9S2vPlwpkLBi8ZvEX8E3vkohwNsm/6wlxgTaeRyLVW
	9nv5cu00vWPat4URCmMcwgbbc/Q0gflmKpUQOrN8=
Received: by mx.zohomail.com with SMTPS id 1732608558575379.05450819026044;
	Tue, 26 Nov 2024 00:09:18 -0800 (PST)
Date: Tue, 26 Nov 2024 09:09:14 +0100
From: "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
To: "jackson.lee" <jackson.lee@chipsnmedia.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>
Subject: Re: [PATCH v0 0/6] Improve decoder performance and fix critical bugs
Message-ID: <20241126080914.o3oidppg4x7rkmgw@basti-XPS-13-9310>
References: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
 <SE1P216MB1303E8E288DCBD1DCA6C07A0ED232@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <SE1P216MB1303E8E288DCBD1DCA6C07A0ED232@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
X-ZohoMailClient: External

Hey Jackson,

On 22.11.2024 03:54, jackson.lee wrote:
>Hello Sebastian and Nicolas
>
>Can you review the following patch ?

Currently on that I'll try to give you another update by the end of the
week.

>
>Thanks
>Jackson

Regards,
Sebastian

>
>> -----Original Message-----
>> From: jackson.lee
>> Sent: Tuesday, November 12, 2024 11:15 AM
>> To: mchehab@kernel.org; nicolas@ndufresne.ca;
>> sebastian.fricke@collabora.com
>> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
>> hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>; lafley.kim
>> <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; jackson.lee
>> <jackson.lee@chipsnmedia.com>
>> Subject: [PATCH v0 0/6] Improve decoder performance and fix critical bugs
>>
>> The wave5 codec driver is a stateful encoder/decoder.
>> The following patches is for improving decoder performance and fix
>> critical bugs
>>
>> v4l2-compliance results:
>> ========================
>>
>> v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
>>
>> Buffer ioctls:
>>                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not
>> supported
>>                 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not
>> supported
>>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>         test CREATE_BUFS maximum buffers: OK
>>         test VIDIOC_EXPBUF: OK
>>         test Requests: OK (Not Supported)
>>
>> Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0,
>> Warnings: 2 Total for wave5-enc device /dev/video1: 46, Succeeded: 46,
>> Failed: 0, Warnings: 0
>>
>> Fluster test results:
>> =====================
>>
>> Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0
>> Using 1 parallel job(s)
>> Ran 132/147 tests successfully               in 67.220 secs
>>
>> (1 test fails because of not supporting to parse multi frames, 1 test
>> fails because of a missing frame and slight corruption,
>>  2 tests fail because of sizes which are incompatible with the IP, 11
>> tests fail because of unsupported 10 bit format)
>>
>> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0
>> Using 1 parallel job(s)
>> Ran 78/135 tests successfully               in 31.808 secs
>>
>> (57 fail because the hardware is unable to decode  MBAFF / FMO / Field /
>> Extended profile streams.)
>>
>>
>> Jackson.lee (6):
>>   media: chips-media: wave5: Fix to display gray color on screen
>>   media: chips-media: wave5: Avoid race condition for interrupt handling
>>   media: chips-media: wave5: Improve performance of decoder
>>   media: chips-media: wave5: Fix Multistream Decode Hang with no IRQ
>>     Present
>>   media: chips-media: wave5: Fix hang after seeking
>>   media: chips-media: wave5: Fix timeout while testing 10bit hevc
>>     fluster
>>
>>  .../platform/chips-media/wave5/wave5-helper.c |   6 +
>>  .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
>>  .../chips-media/wave5/wave5-vpu-dec.c         | 410 +++++++++++-------
>>  .../platform/chips-media/wave5/wave5-vpu.c    |  23 +-
>>  .../platform/chips-media/wave5/wave5-vpuapi.c |  11 +
>>  .../platform/chips-media/wave5/wave5-vpuapi.h |   6 +
>>  6 files changed, 305 insertions(+), 153 deletions(-)
>>
>> --
>> 2.43.0
>
>

