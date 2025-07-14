Return-Path: <linux-media+bounces-37623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5B7B04034
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E90C0166936
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E862248866;
	Mon, 14 Jul 2025 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="cF7SlMQI"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D486F236A70;
	Mon, 14 Jul 2025 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752500187; cv=pass; b=Dy1p+mRfgzN9rdRoEAPTfR3D/zujZ7pqgODYoBTeq3tHjpkTrPCoOAlGJ7xMRmLlJKfWyelzxoTbxtPmwV3V9dMbrRcH2huSbrCQxHgf97rNp63ytwY3VOVn8wQhSd3XkPsk9oU3+hneLXVjL9VH44oS52YDnAae2o++zbhKwLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752500187; c=relaxed/simple;
	bh=3PX1K71yszUYNO0T/AEtvp1Oa/aw4df/3ahyuw1mn4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DtvNb85gFOM/ljmW3B5GxdoWH8fgUC95A37aFDR5fGlWZPWNwuyFTtnYYg7QjXOoAiL49AIIBgeGaLXERaNjf3e7TSEJ6I7q5n2ERUX3MPL5q+tbOZJOd/G2OvHIxqGHxbaSogzFiBjR5BNleq884qvVAUXbMn1CXykKg2TqHpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=cF7SlMQI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1752500130; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LLwf90veDCfX/vug+RY51XJsew+TIOZx7ZDM1Z2CSQQciK1qiq4NgD6QzC3oXvHLraPMuS9r4r08v3rRKvkam1IsL54XA/7L3kWF73CpjhwlXnBM0t877peicmCqjD9fI0I51SfS5dqZHB2BA67UOaoku1ckdm6kmCRsxMSzgwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752500130; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UizOBT89f5MRX6YGiBh9LFBmNsdbZc9aL8t32eOk9Ls=; 
	b=DG1MXaTm0GH7Zzhu75mIeDgkj0NacaYQEAJk7lYWjDOfg5HqLc/uxecDifFzLmrvYKxSD/mLlrDSNnWrDi/LWRXmcQJeSEw08v1WLlNyPlLVj7mlGFKqWDEFTvHhBzwxugL0xZZTZeJ/KcEbr9IZ9D4uP1o/jmIgRTO4Vw1Nv/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752500130;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=UizOBT89f5MRX6YGiBh9LFBmNsdbZc9aL8t32eOk9Ls=;
	b=cF7SlMQIVCLi+7LyiNNzpE0msj22oD9LyCxoRHQVUNRlv+qOxfVUPSMBNdvJbscZ
	OLdlAaeWMmXFLxxuYh4gLPwm8eNgwqt4xWl52WtxDLR0xqiUT8hub7S39Q2edenUd1J
	SnxY+eKDm6GfP/fT6GS7lJF8E+rhvBO2yMuZRqPE=
Received: by mx.zohomail.com with SMTPS id 1752500120862937.2041501644019;
	Mon, 14 Jul 2025 06:35:20 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: heiko@sntech.de, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 mchehab@kernel.org, nicolas.dufresne@collabora.com,
 nicolas.frattaroli@collabora.com
Subject: Re: [PATCH 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Mon, 14 Jul 2025 09:35:19 -0400
Message-ID: <2229133.irdbgypaU6@trenzalore>
In-Reply-To: <20250713142514.56742-1-liujianfeng1994@gmail.com>
References:
 <20250708151946.374349-1-detlev.casanova@collabora.com>
 <20250713142514.56742-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Jianfeng,

On Sunday, 13 July 2025 10:25:14 EDT Jianfeng Liu wrote:
> Hi,
> 
> On Tue,  8 Jul 2025 11:19:33 -0400, Detlev Casanova wrote:
> >As there is a considerable part of the code that can be shared with the
> >already supported rkvdec decoder driver, the support for these variants
> >is added here rather than writing a new driver.
> 
> I have tested the new series on rk3588 and rk3399 with chromium. Since the
> HEVC decoder need EXT_SPS_RPS related patches, I ony test the H264 decoder.
> There are two issues:
> 
> 1, The decoder max size is detected 1920x1088, which should be the fallback
> size when queryig VIDIOC_ENUM_FRAMESIZES[1].

From the linked code, the max size is hard coded to 1920x1088.
The driver sets the frame size type to V4L2_FRMSIZE_TYPE_CONTINUOUS, so the 
snippet you pointed to doesn't update the values for max/min. See [2] for the 
discussion about using V4L2_FRMSIZE_TYPE_CONTINUOUS.

> 2, Playing H264 videos ends up with green screen.

Can you elaborate a bit ? What videos ?
Is that on both SoCs ?
Is there any logs in dmesg ?

> These above issues don't happen with the old rkvdec2 series.
> 
> [1]
> https://github.com/chromium/chromium/blob/138.0.7204.92/media/gpu/v4l2/v4l2
> _utils.cc#L520-L533

[2] https://lore.kernel.org/all/c7882f94-e2cb-4023-a53e-87ebc8fa3460@gmail.com/

Regards,
Detlev





