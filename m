Return-Path: <linux-media+bounces-22542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D37E09E1D1F
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 14:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99CF7283097
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 13:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B781EF085;
	Tue,  3 Dec 2024 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wzfxKmuY"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E456E1EF080
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733231341; cv=none; b=atelsyJyN2/yLLNrzq+Ul1vnv842nmmRgk08GRMqTaNDUPH9pDBwInA126diPo0ESyGOdBi0WMpJHU0pCGYKH8MhPB2QlApIf1FdwPk7BigdLjwLdvlQqwf1qW12l12K4os1qNuRfvstLrD/ZutLzWIt3XE8Lq/lmnDnUPP1OUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733231341; c=relaxed/simple;
	bh=WoMHRJb0tkxTD9vjf51l2F+vHsZpZpKuGhGA2Oq1gss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCiXpXsmhsqAb0Qoz4HyfizK8696dm/PpQF5Z9MNXyttdYzXTMM5ZoOCrl7Pb7Scc7p3iqs0JJeckvwcY5XTC3wkpPZ2zSQNzDwLhF9hKNJ0zZnZ4lzHPP4EWqnSiVXRy91VqdDddPRmYTi/IhfOOEeiGoHoMlTLUb35dGS8Bbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wzfxKmuY; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3001490ba93so1154931fa.0
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 05:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733231338; x=1733836138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/lL5pAiR2kE/Mua5K3k92X0rB9806Pb8dHr6N7ntE4=;
        b=wzfxKmuYk5ozemAQGpcNecfNwB1VoPsCN0nT8udbJgCnd4C128IpW7bfZ7EmHeHFfb
         geQgPtClkssTwkbCqtfQU3Zo/VfMBZy+J9enEoSYswfL0FPFvnwKtBSuvCbna8fld9Z/
         88FyWdMGgHSp8Jv/uEKMnoBGJZl2fwCht80Ustv9gMstEyZA91OfbZpZidEekDR/lymH
         GYSFQRr2Xr6xJzKRxedoIMW7CgRDn9PtY1XJ/NVzKg0+MVTX7uJC17i4mNm+91aUxMKo
         X3jiuJa5hSZyXMviaywgKgzI+akl/s9cBFZF2qczSp15ktgGYgwf5v5P9fuymPaNlzjb
         Ml6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733231338; x=1733836138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/lL5pAiR2kE/Mua5K3k92X0rB9806Pb8dHr6N7ntE4=;
        b=OOYvOq424lMBGcDAlbuEYETsXeEU3IGtJ5NNY49+thKIs9LXyQm7C03E4XlkuDpgT8
         LJLsEXNR5nCQDrMSTorP1PW+sTuUdA9A1qT57APadhPC6Efr4wLMimpy0jTEb/Bo/uTe
         7GxPdFh+1PsHXH6KXHH2hVZN2v+DCgV4rstphmoScBNE864E9P9LRgv3JvAQxSwSYBfh
         fZ2I1b6ur45YFzqtuBWROjkXOo/kkaOUQQ2iFa1ZmtPykJU3ocD9AuIg45gubhQvpM2L
         MBUd7qei5D7s2a2fTeA9KIoY0uL7tVZ2YdiMn9x3ZD0O7Pd8ZclEahP9RLsUuMHTnnJ0
         GGdg==
X-Forwarded-Encrypted: i=1; AJvYcCWz8RgyY/fv0SJbuQZh7K6CfTT4JOq8cLthDrBz+mxVhQThMNmMqA2vEKXI8wx5cpbokZL5tvdJf8Id8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8otR7rvkZUljgE7NAns9VZLsfP1A2Oddfu9qGxZCbzQBXSX25
	UDtdgLvQswar4u+YV61X7C3vkBSaVmSqauaThK9gRgrH4QLaCygaeHfR2vQ3r18=
X-Gm-Gg: ASbGnct9SzUPzCav/ZHDPxy7T1Vt4ADqlfON5f7uLuMBneYW34TXGS8r5uKMjO82O7R
	IW+o6AqeqP1SuZB8dzc8wl94LgBuALJp+AJjWnLUdx4GXf1c0bsmoqSW+x0JziNqJBs18Zm/ame
	7Gu5VRmcFGNGRjwWt6N9ysBrILxROh3QcgR+B5NrFcGqg0KXdIrZZp0fuBJEeOQvFIkcyLbsg6f
	Fz+y2zI0n6yM1EV6otg7VDyehFcOAiT1xG5H+m+tYos4CJNLrtN3ZVkE2FUKbFCj6InZyIgdBKA
	+sByftBjQHsnMkl3656I5QY4U2cwrw==
X-Google-Smtp-Source: AGHT+IFThbwM7lX3Y2ipfgIhRvnqePc6hLDMc8QwYoeSkbRqOQTvnGXT+2fwk+HTyaWcY0FW9Hg0Cw==
X-Received: by 2002:a05:651c:503:b0:2ff:c349:8d08 with SMTP id 38308e7fff4ca-30009c73a30mr17954081fa.8.1733231338062;
        Tue, 03 Dec 2024 05:08:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3000a3fb991sm1970151fa.70.2024.12.03.05.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:08:56 -0800 (PST)
Date: Tue, 3 Dec 2024 15:08:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Yu Zhang(Yuriy)" <quic_yuzha@quicinc.com>
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org, 
	ath11k@lists.infradead.org, konradybcio@kernel.org, kvalo@kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, quic_jjohnson@quicinc.com, 
	quic_miaoqing@quicinc.com, quic_vgarodia@quicinc.com, stanimir.k.varbanov@gmail.com, 
	quic_jiaymao@quicinc.com
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs615: add WiFi/BT nodes
Message-ID: <vpnvycgbjtksjbktiksaltb73w34ogdxt5satz7cpmel63j3mm@aqvih2idpdfw>
References: <20241203060318.1750927-1-quic_yuzha@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203060318.1750927-1-quic_yuzha@quicinc.com>

On Tue, Dec 03, 2024 at 02:03:18PM +0800, Yu Zhang(Yuriy) wrote:
> Add a node for the PMU module of the WCN6855 present on the qcs615
> board. Assign its LDO power outputs to the existing WiFi/BT module.
> 
> This patch depends on below patch series:
> - base
> https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/
> - pmic
> https://lore.kernel.org/all/20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com/
> - pci
> https://lore.kernel.org/all/20241122023314.1616353-1-quic_ziyuzhan@quicinc.com/

This doesn't belong to the commit message. The list of dependncies makes
no sense once they land upstream. Please switch to the b4 tool, use b4
prep --edit-cover to list such info (it will be automatically added to a
non-commit part of the email) and b4 prep --edit-deps to list
dependncies in a machine-readable format.

The patch itself looks good to me.

> 
> Signed-off-by: Yu Zhang(Yuriy) <quic_yuzha@quicinc.com>
> 
> 

-- 
With best wishes
Dmitry

