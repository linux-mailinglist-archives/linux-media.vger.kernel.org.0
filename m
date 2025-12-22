Return-Path: <linux-media+bounces-49352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40514CD61F8
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 14:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6571C30136CC
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 13:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37E62DC348;
	Mon, 22 Dec 2025 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLPd9brG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cEtF1moX"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED1F2DF128
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766409586; cv=none; b=ZXYWge8+ju8pPnv1jbtu3gBEBsmOxoJPVxXW7BXAaa1ZrPd18wb4wApBa9nN20gK5qlJQ0dTh9ZpG0GM3rEkjOIiKMQpFO2hMyLUu4+KHX3zCTviv69Yd7rTzQJY/R7/oe7CUMJj02Qf6VM55CbJQCcbb5zlY1bh1PDrYgos6Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766409586; c=relaxed/simple;
	bh=h9nsh4CigWEx7zEy8phiB2ROpYaDMSZ0wAswdlig1GM=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=b3j9XlVAfQtiP56Id1mdeUjRZEqTu0UxvmZIN+Erl47wS4aGaP9g9Apq5/kp0ctCzHg9Ny0vSb7KsMwBulXZpMfSjnEySMfE4rNRVhioRMIzFMwop36p/hi4jrzl+d28wTzzSLVXKXY0Z8He+twOD3BWdY1HsBFxscLhvFQPo3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLPd9brG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cEtF1moX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMBKSWQ1783581
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 13:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kuRXWm5nGrEQfCDsfi46R7
	LqJXKLIhkJ9AnnQKLSxS0=; b=CLPd9brGt29FHGIuVZyaXwIzMDE+Goq9vS49+B
	qk7894/UUEEvn8oQAXIvCXaMy83G+zi/z4cbVCxYtuJ5hPcnHwsJ+VPJ6dcvA5mk
	a0kZpWH90k0yJC+gBu10kATp1ZBxcxVV2Nq6PJbJ2rJUbndFAxsMjecN4GR+ROtN
	TKJVKQjYLfNnH0UdIhQnL/Rzd1rzC2RwXzJuVw7PzePbSVV35+KECsMs7QGEszX1
	9QDP3Ny4uNJLSplNTrlqUoC3C9WBtEGX0ItLwOeYVXRHyikto6SAeNFxSSsYbA/b
	62kfxmiO2tikMS5I+khJUNW4LGiOPI59TRhO1J04mUN2CcWA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mtqn3s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 13:19:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so88598511cf.2
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 05:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766409581; x=1767014381; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuRXWm5nGrEQfCDsfi46R7LqJXKLIhkJ9AnnQKLSxS0=;
        b=cEtF1moX6ftLh80/x77iC6l2ZNzuMQDg/AexBPLu28d+HORH/3hzJO6Dn+Gfe38G67
         sxFLDRTnTpYgeSnod04OgzzCHisF42FJpfMGocoJN2tBWyNneFnGYQS76wlEe0vcYAlr
         HR24YKfDQ66qrKyLkXkzQudaqDq5bOsnlVBe0DWNoyE1v9myhkPwYqkj6hR4JpMR2y3+
         4x1CrhqvGgeCqQFAQ139WdtNtMgaAHZjN+7N6SB3MHVoseyL+BbHeSGs4Vz7m+5yrs4d
         nckMQm7jRT9wnv9iVtJK9t9eJHLG49KuWfx5HLcGMmtB8IvtxW4wYDqSyolcjuOGwBRJ
         OeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766409581; x=1767014381;
        h=content-transfer-encoding:subject:cc:to:content-language:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kuRXWm5nGrEQfCDsfi46R7LqJXKLIhkJ9AnnQKLSxS0=;
        b=RJcWP/eydpCVnjY1qQW2bmDXgmYhf+KywmnfxHqU2jDu8XiB4X8pEW9Eh4Jjjs/wfo
         H3p4M9HqU2jXfr46ypF30ciN4j0OpqF4d9JxPeJHjtydIamLEYaQ+XvhVeLKbfJEVxY0
         odpE4hyzrCVlQHhSeTJwpti4USzIc0cQ9E0sY55VWJuQOsZ1vlH3++yR9yR/DH4IFNe7
         AdOB8V+OR7qVJ+zQIccDE9LrJfee+fR/xv7Lp9TG9ylVWIbJhjPpDm9RNAAjyC/FE99J
         Zp6i7wmXnBTbYTwl4mudDytpn0rrBZlsHTekFguH/VjJhifodXDkKfCv1wSzU2oyDLQO
         /2Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUqgMAn+WX+UrphlzgcFiZQYiIUKYi/s+4m99fpdbXvdiDx/LBu0WI608246D1YoCTGHrfvRVMeZBZ8ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa2OQGuxTOmXn2MF4EMJKkcLodk/NFXgAyQ4DMwXEbgiJWomAp
	kL3RANXMOOPVoq9ddkBAKJCv7yKEJkRLqfxC+k0tyO8znPse3US16aHM4ktCcSx8R+YJ4yvQ65P
	q30syvSSE+yzqG7dngne9JlQzLCsuwWKUUaxlMqFOQqdMCeJsWbZhQg8/LvPo+y10kw==
X-Gm-Gg: AY/fxX6Z0J4VUqCtDSak37sAOIH5Mlit0bbwSjGw2O+YASXvJQ8wrt7NgBeddfsW8d/
	d0fFbdA3CstW5wgJ7UUPeif5r73omhd7G+nJwrcv1mKDBRvXC7sCpBplXJ7IQnoSbdZnuAdK9Sh
	027ZkZIxIH0blw0UW70A1dwgE3Wyx4W0HRXslaFKlXq2s9yi9Yp0h3sWb3hCa9b9V7fKOSOT6gC
	RiXa7TZzEMyoibmwPAHUAK1oBSAnxfhPdCoNZ7Rj2gbCib1N06D7QIYeFt1krG3cm9QvRiakqPp
	USMampGsv+/4VjG3bb1Eya1fiLzn21ndeomc1oKQZ8iWS2daov+NadoWifWogMLjqesb6gZPcpY
	T1+i0TTNskZDO/dpp8nCspCw77aAVeBpOnSOE1Ulh9EqPVfo2Ep2jbfrKkrO9hGkLKgTU+rhy3D
	raWDtxQN05E78/Enp/JicyufCeIPp1ig3jOAPgpDTe4tWVEwnAwe+LB5Guv0vUyymEApxWhDgWU
	HxX
X-Received: by 2002:a05:622a:3cc:b0:4e8:baad:9875 with SMTP id d75a77b69052e-4f4abccf532mr171014591cf.4.1766409581008;
        Mon, 22 Dec 2025 05:19:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELwf8ZyJWrf2RFVmzOxCKormFQPQ1zoRfYTOBG2BiemMTxvzQX+TIsRcZURYg+Nv3UDwCl6Q==
X-Received: by 2002:a05:622a:3cc:b0:4e8:baad:9875 with SMTP id d75a77b69052e-4f4abccf532mr171014271cf.4.1766409580602;
        Mon, 22 Dec 2025 05:19:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9d8sm10235151a12.11.2025.12.22.05.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 05:19:40 -0800 (PST)
Message-ID: <7ace3edf-ad5d-4dd5-b131-cffe75bad6c4@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 14:19:39 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
To: Hans Verkuil <hverkuil@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        John Bauer <johnebgood@securitylive.com>
Subject: [GIT PULL for 6.20] uvcvideo changes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0R-UXzO-azE581TYH6b9H-pf6L0s7HEK
X-Authority-Analysis: v=2.4 cv=dPWrWeZb c=1 sm=1 tr=0 ts=6949456d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=ETVlQFC6gLVbihIIrSIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 0R-UXzO-azE581TYH6b9H-pf6L0s7HEK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDEyMSBTYWx0ZWRfX3NL+yfM8mEJw
 ck6loIsRh6csTipPII9kUPg/Siv7gLoK8nHxI9LGGG304PcxqRCTTB9NIp9QapdC4wtl9FUb7ed
 ZEfUXM582V2AciX6Zc/b7QDRfPsgPNEn4BrsEs84DRcB40kmRxX1Wxz7Z/dwuOR0zObZRoYBkxc
 n82PUhAXR0AYWnqG1jlcYKscegjoGFxSWVSJ7lY1nl60NxUt0rs12FbhVyqBXt0rXaqJYNQGwxp
 z94hRmeMr3JSJsH0vj+c8GZ/VM56mvD8MB3dY5gPYx4xrXhoWjd1hE4tfkAkkyRvYoGbpwnbjE1
 6GLkDFrvbcVHAf/gfcmNktIMJ5LCWB20ZeseT+LG5PzNjQeu9IdfCZhcOcDAF6VW6hWSO6rn5GM
 UzPMX+4t+YsiNh35Ebmk5VBrrgM1yiPNcHnhFuqazZJEDdvqTD+7TR6Tl+MHbHfq/jp9Ao+w921
 UOx+OXdTcZYoHzzX+8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220121

Hi Hans, Mauro,

The following changes since commit b70886ff5833cf499e77af77d2324ce8f68b60ce:

  media: vb2: drop wait_prepare/finish callbacks (2025-12-18 11:14:57 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/uvc.git tags/next-media-uvc-20251222

for you to fetch changes up to a5fdf846c2f4fce9c89cff7c5a2f24710c5bbab9:

  media: uvcvideo: Document how to format GUIDs (2025-12-22 08:51:38 +0100)

There are a 2 checkpatch CI warnings:

https://gitlab.freedesktop.org/linux-media/users/uvc/-/pipelines/1571602

Both are "CHECK: Alignment should match open parenthesis" warnings,
this is existing code being moved around and I did check and
I do not see any way to format the code nicer.

----------------------------------------------------------------
uvcvideo changes for 6.20

- Fix support for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX
- UVC relative pan/tilt/zoom ctrl minumum value fix
- Remove deprecated nodrop parameter
- 2 other minor changes

----------------------------------------------------------------
John Bauer (1):
      media: uvcvideo: UVC minimum relative pan/tilt/zoom speed fix.

Laurent Pinchart (1):
      media: uvcvideo: Replace dev_dbg() with uvc_dbg()

Ricardo Ribalda (3):
      media: uvcvideo: Fix support for V4L2_CTRL_FLAG_HAS_WHICH_MIN_MAX
      media: uvcvideo: Remove nodrop parameter
      media: uvcvideo: Document how to format GUIDs

 drivers/media/usb/uvc/uvc_ctrl.c   | 79 ++++++++++++++++++++++++++++++--------
 drivers/media/usb/uvc/uvc_driver.c | 19 ---------
 drivers/media/usb/uvc/uvc_queue.c  | 25 ------------
 drivers/media/usb/uvc/uvc_v4l2.c   | 10 +++--
 drivers/media/usb/uvc/uvcvideo.h   |  3 +-
 include/linux/usb/uvc.h            |  8 ++++
 6 files changed, 79 insertions(+), 65 deletions(-)

Regards,

Hans



