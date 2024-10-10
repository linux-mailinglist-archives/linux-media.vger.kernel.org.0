Return-Path: <linux-media+bounces-19356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E42998A75
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 16:55:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480AF1F262D4
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 14:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FDE1D1F79;
	Thu, 10 Oct 2024 14:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBrfrGOO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F971CF7B7
	for <linux-media@vger.kernel.org>; Thu, 10 Oct 2024 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728571256; cv=none; b=qSEnmFi+VL0XOTahj2e5z0Nrby+SQ9nO15+8z6Q8HHnlmCSLv62PL7xlgFKESnvhLUoe0vwLj+5dbY7Q9lKrgwinvJWRoyYICS8w57C3ve/6QhuNelPnYbX2Du5xt5PKsa3L7kFF0B/3NrcEYwERdZlea5/5SHPrnp1PpislW8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728571256; c=relaxed/simple;
	bh=fHaTG50T+XNNagn5TCtb74sk7q6Zn6Tnl5l5AASz3rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCA3DI/c3LM00QPRfO3m3GT0vLZLPKLNW9RJbPIt72oGFnVHr3+JO3UW/OaxML1iXEGtpYdNCEXxAhY6oNycPFzJgvxWz4g5jwKZAEr74+Tl1GCRExHfytwNYfpAV4NZG5mXrSwnGfeKvYVoOyf088Gmh5+rNB4zqNY5JlETTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBrfrGOO; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5398e4ae9efso1354323e87.1
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2024 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728571252; x=1729176052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mtk3swPKSpsu2qGiM0596EX3cWtxyHnGiYTHhFIO7M=;
        b=IBrfrGOOn6WYdK8I0pcRITxvW73FhdwJN9XxPwuEJtqQVhfMw6y1vq66Jg2Z9dqlNV
         Cd2NXlLfkDlYcyvaVnuPWGWVLK61Nc5897p6eBGzmoNQeEyaApSYOX1zF6P19hoiLVkX
         eBzR8oMgCwxch4J5DSP23+8NopHr5yBV+RlvlmwcDHscL6pl+5y07s5cyVcwjoSD+eSM
         n1qAKQz9Q+OFcBKTue6VBwPM1nfWTpNCSvLlt+xgVVsH1uvYrUE5sDVkxTutELtPVCZ8
         Fph5tk/T9bDI80Xyxm5UEJg4ySOrtyHMZZ7BY5nUNxc11MA8RJ4Nd+Aqv8IlZq6iYp3F
         BfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728571252; x=1729176052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mtk3swPKSpsu2qGiM0596EX3cWtxyHnGiYTHhFIO7M=;
        b=mMjyHjGuxx/q0YGAO5V2GopWdU39OLgeiRelt8f/PqVcPHD90xbdfixAx6cFSbem9w
         PE2VljyjiFvJDvDJz1cLOxpJsZA7WUDT+FcWIQAotZFaSZTuNX+6k1YvzGPIv7p9JDM8
         c8gWvHkTViyqinT3BbMRZJymPTw4uMuKSfKSq/Jl2z+wtoTlHriZvO0BOa/uDf+gkFKu
         o2SvzUAdXH7gIdV5SjgUHSN+d8jS9oXoKZFCdPZ+APCOVSiI/9V99WMDVYeOoFxKcoNQ
         aXIN779K2Dh0RShPmFiiYf46/xIWWXesGUiGnIvEF/j9YnJbw4ND/q5fP0mjBKPiuQJr
         z8CA==
X-Forwarded-Encrypted: i=1; AJvYcCXvaqUbXhq5Dvi1fmaC7cVfMybsd89/k3jI5Kas8xp+iQ2rpz2W9qoS80u8Inhx9H1qtTk98LruVMj98w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3m28uQA0zFhBvwdlIWV6funOHm4Aq/zz7wE8l5SCrMNJtITrb
	GD72CHLoXr2amTs3xA905YmWOYUjtaDo5LkeCE0+/mihQnp/BiBM50uhipFT/AY=
X-Google-Smtp-Source: AGHT+IFUFKq0lYxlNzsXXq0fVnKrrxCKW8Nx3h/E3Xc0xNLj22cjL5q4txAh0aZwNXPW20/Wr1C2qg==
X-Received: by 2002:a05:6512:2348:b0:52e:9b9e:a6cb with SMTP id 2adb3069b0e04-539c4899755mr4276741e87.15.1728571252194;
        Thu, 10 Oct 2024 07:40:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb6c8a54sm273302e87.115.2024.10.10.07.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 07:40:49 -0700 (PDT)
Date: Thu, 10 Oct 2024 17:40:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com, kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <3giotvkrwailt75gndhup7xhqvlc3vdowdoypi5vaeebuojp45@vkqxbtjsbksf>
References: <20241010132902.2882939-1-quic_miaoqing@quicinc.com>
 <asvhh4kzq6s6yz3wrqfmuolcnlonoobogoh45pnq4zdr44lpxs@zgarzpduk2sk>
 <cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc8358b1-2442-4a40-8eb3-0912423db554@quicinc.com>

On Thu, Oct 10, 2024 at 09:59:11PM GMT, Miaoqing Pan wrote:
> 
> 
> On 10/10/2024 9:47 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 10, 2024 at 09:29:02PM GMT, Miaoqing Pan wrote:
> > > Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> > > board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> > > 
> > > Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> > > ---
> > > v2:
> > >    - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
> > >    - relocate pcieport0 node in alphabetical order.
> > > v3:
> > >    - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
> > > v4:
> > >    - update 'ath11k-calibration-variant' to "Ride".
> > 
> > What exactly is Ride? Is there just one Ride board? I thought it's a
> > board family name.
> 
> I just follow the existing boards, 'Ride' is a board name. Both 'Ride' and
> 'Ride r3' boards are attached with WCN6855 WLAN chip.
> 
> arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts:1112:
> qcom,ath11k-calibration-variant = "Fairphone_5";
> arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts:958:
> qcom,ath11k-calibration-variant = "SHIFTphone_8";
> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts:879:	
> qcom,ath11k-calibration-variant = "LE_X13S";

There definitely are other Ride boards. I see patches related to
qcs8300-ride. Does that board use the same BDF file?  If not,
Qualcomm_SA8775P_Ride or QC_SA8775P_Ride sounds like a better approach.

> > 
> > Also, could you please extend the commit message with messages from the
> > ath11k driver, showing the chip_id / board_id ?
> 
> The board-id is non 0xff, do you still think we need to add
> 'qcom,ath11k-calibration-variant', following is the WLAN chip board data
> info,
> 
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=519.bin

I'd ask Kalle / Jeff to answer this question. Are we sure that this
board-id won't be reused by any else device?

-- 
With best wishes
Dmitry

