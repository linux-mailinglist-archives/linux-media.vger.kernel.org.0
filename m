Return-Path: <linux-media+bounces-19243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA929947CC
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 13:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AEB91F247A6
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2024 11:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D3C1D6DD4;
	Tue,  8 Oct 2024 11:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wZLHUznO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC7B7603F;
	Tue,  8 Oct 2024 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388534; cv=none; b=tYQO7i/VQffluKzrTGuq1CuBLk7wMtd5DUsmXvAEWZP85STzgWMJt7sPR8Wnd0/jyxVDZ43hDqk2DYeFDFTJ7qZ693lA818G7Pg8dbXFxY2nz4BJM/SEePUQgbjFDvj5owZC1n+UEDKuBdCE7lqfz3bcW1qdSCra7A997Y40ql0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388534; c=relaxed/simple;
	bh=3OCQxvup2AMr6WZ7I+5yA6H1i+P+6X9ndx6UAPQlhd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JFo2q0dO65JWC+LMNJ6GsBgGVmk87t4mwfkIGlt9tyMY5iQQkFnqHs45ISiY35DpJA5fUkKUtYKc0OtHiUBBRRINKxVWivxgDT72WXFwV5eXqC0PbPnPzQ9fe3oC9j5CWoDUa9qRDp6FtRR4bGtabfm2EBAIYx7peTgZPwvjfkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=wZLHUznO; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 498A7JAW022075;
	Tue, 8 Oct 2024 13:55:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	r1DaIo5foOHFEMChIot5/wHw4xGLgo2eu0sEviXqgsw=; b=wZLHUznOjmm5Xo8g
	zv/VuOfk+OFSwu+MSnSke2fKse6q1sX5rLDboLAuhF0Ko0es8ZRF46kXWj1/F1/w
	4UKLeEaYhyhs0caFsV1Eibb4XZvhYi/MNMYbyk94eBGWM8kNolWixkEEZixk4qet
	szmDZYuSSIdUcOx5qgbS6y2DLIOU8VosAYC84CJvOMfjx1hYK7kXS9soio/Aqp3T
	mMY/1jgEPoec7v7z4+2PA4gxt+i3AqWXECANRXh6WX6uwvH8H2Pr2fya6OaHcPAO
	ncmM8yFpWL1CxwSgXOJdqnnfIRSW4TYWqrKLnBjfqnpEYvegmtD2oMI1rxNepXaj
	9K/UJQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f10uds3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 13:55:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 559B840053;
	Tue,  8 Oct 2024 13:54:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47DB5279E69;
	Tue,  8 Oct 2024 13:52:41 +0200 (CEST)
Received: from [10.130.72.241] (10.130.72.241) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 8 Oct
 2024 13:52:40 +0200
Message-ID: <b8def568-e575-4ea3-8c3c-4ca9715802ce@foss.st.com>
Date: Tue, 8 Oct 2024 13:52:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: i2c: st-mipid02: fixes & enhancements
To: Alain Volmat <alain.volmat@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241008-st-mipid02-streams-v1-0-775c2d25cef9@foss.st.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20241008-st-mipid02-streams-v1-0-775c2d25cef9@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Alain,

Thank you for your patches.

On 10/8/24 13:46, Alain Volmat wrote:
> This serie includes a fix within the error handling when enable
> streaming and another one regarding supported formats.
> It also update the driver to use the streams pad ops
> instead of the s_stream.
> pm_runtime is added to be able to control the supplies & clock.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---

For the whole serie:
Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>

> Alain Volmat (4):
>       media: i2c: st-mipid02: fix mipid02_stream_enable error handling
>       media: i2c: st-mipid02: use enable/disable_streams pad ops
>       media: i2c: st-mipid02: add pm_runtime handling
>       media: i2c: st-mipid02: remove parallel mbus format on sink pad
> 
>  drivers/media/i2c/st-mipid02.c | 117 +++++++++++++++++++++++------------------
>  1 file changed, 66 insertions(+), 51 deletions(-)
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20241007-st-mipid02-streams-2188cc8b6fda
> 
> Best regards,

-- 
Regards,

Benjamin

