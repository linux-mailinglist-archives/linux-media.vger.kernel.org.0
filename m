Return-Path: <linux-media+bounces-1380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7A47FDE1E
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 18:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AECEA1C20BA9
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 17:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B6A645014;
	Wed, 29 Nov 2023 17:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="evbDLOpR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14726B2
	for <linux-media@vger.kernel.org>; Wed, 29 Nov 2023 09:15:15 -0800 (PST)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ATGwbg6005251;
	Wed, 29 Nov 2023 18:15:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	date:from:to:cc:subject:message-id:mime-version:content-type; s=
	selector1; bh=XZHq+X2VPKMut9kIMb69IhrXhDh79IRPoIXITApInVU=; b=ev
	bDLOpRuH+qWiVXxyIgGVCCYIXfo5UOU4nr5p6b7w2ebjValQEAfkPB6hSUc4KR4a
	wPUbWrtqhP9RPZ5SvxLUi4gXTDRbKZh98vGxDkuCoXjmebvl3EAQO6T1EyYAk8pz
	4JcNWL3wdCuwhRf0X/wHF9gJkNBna+F1GnkjJNxW1/I8eORlmHWHLAcBZBqX2hLw
	HFsFjD6HJZbACTt8MfMBP9p30tRmYLmNroT/lCQlw1ZyHzrPDK3xF4wjNVdgesCb
	sU8Pppu557ZWEkbOtN4fAEQn/T+yfT2byloyqtGUoBqMjzXG+xfJnbYhYkm9hJmk
	TzTCaQR08zWJnW/yjaag==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3unffdx2c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 18:15:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A97510002A;
	Wed, 29 Nov 2023 18:15:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5D11D22FA30;
	Wed, 29 Nov 2023 18:15:13 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 29 Nov
 2023 18:15:13 +0100
Date: Wed, 29 Nov 2023 18:15:07 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <linux-media@vger.kernel.org>
CC: Dan Scally <dan.scally@ideasonboard.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
Subject: [RFC] frame rate control on a (non sensor) subdev
Message-ID: <20231129171407.GA1705272@gnbcxd0016.gnb.st.com>
Mail-Followup-To: linux-media@vger.kernel.org,
	Dan Scally <dan.scally@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_15,2023-11-29_01,2023-05-22_02

Hi,

the DCMIPP Camera interface (platform/st/stm32/stm32-dcmipp) is able to adjust
the capture rate.  As an example, even if a sensor is streaming at 30fps, it is
possible to either capture:
   - all frames (aka 30fps)
   - 1 frame out of 2 (aka 15 fps)
   - 1 frame out of 4 ...
   - 1 frame out of 8 ...

In such case the dropped frames won't go to the memory and will be dropped
internally by the HW.
This allows for reduction of the amount of captured data, reduce the bus usage,
and can also be useful when the same sensor data must be captured in parallel
by several pipelines outputting in different formats/framerates. (the current
stm32mp13 has a single pipeline but the stm32mp25 has several).

Having a look at existing subdevs within the media tree, I couldn't find similar
subdev having an impact on the framerate (apart from the sensors).  I first
implemented this behavior using frame_interval control on both SINK and SOURCE
pads of the subdev however linux-media doc clearly mentions that frame_interval
should only be done on one pad.  Original idea was to compute the difference of
frame_interval between the SOURCE and SINK pad and thus apply the settings.  As
an example, having a SINK pad frame_interval corresponding to 30fps (coming from
the sensor), and setting a frame_interval of 15fps on the SOURCE pad would lead
to configuring the DCMIPP to perform capture of 1 frame out of 2.

Another approach I could think of would be to have a dedicated ctrl on the subdev
to control the frame rate adjustment factor.

Do you have guidelines regarding how such functionality should be exposed ?

Regards,
Alain

