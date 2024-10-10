Return-Path: <linux-media+bounces-19346-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9A6998835
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 15:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 321602872B6
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 13:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1D41CB306;
	Thu, 10 Oct 2024 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gIQbxEz1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD3A1C9EDE
	for <linux-media@vger.kernel.org>; Thu, 10 Oct 2024 13:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568078; cv=none; b=rbEZTOtb+zlRPJxx0V1a5FHdw31KbU1PT6d/oELVf1WOSSFb1xKeRQ1iZfHJkLUTCpPDzWCoj/f9DuUc1O9FkfP+RY+r8PZVIwoDSEihRZqTvW+uv/5wHjawOWWkreEYTGZvsjvDi0Jj8UHDm3jcec+TO+0MefQ9AqU7R5Z9SSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568078; c=relaxed/simple;
	bh=YCktKjLn0MSEw2PJMMzh38/Oa32wsLHWQSGx36/qLTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umPahVc8BrGQPu0KtqEr32g72pWqGxo22vd5X309QfJqIzw4zDRGlAFMjcYPj3XGCjIPcWzW+si0mRRzM9S2XFEyYwgLEY2sWLNkVCvaugAF9IfhESfFdQsPa7z8h8712cWTFN0BIazxLs1jhA4fLKtyxrDgOhWO5Y5AMfdr9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gIQbxEz1; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5399651d21aso828072e87.3
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2024 06:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728568075; x=1729172875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P72PVJgi4uitEzWkX+CGhxiijiq09qyKhZsAdOcJJtA=;
        b=gIQbxEz1ERcL/lrrrn3U9xlIumMU0XQvl9PAS7fCQyghM6UrJMnBMu4m2AsaK+fEfA
         BAG3cjgox1WDgusI7P2goGNd04H55LSGgvKDjvQnJ55Y4paK/8HMY9QVvmF0D0ghilGw
         2Gnp9YTc+buwRsF3VNHPMmYxFzjSwq9Dy5VczAJ1SZ44gP6aETxwLmWP2+Z6bQuZTPBJ
         22dj1Urs4ABTltlifJbvitP/OZgoAAp1VC8kN9Nvpfmj6Y1oUz5/5UCnbhPMxQSM54zD
         32eM7WIbUKOZmjXgUOVNOG2vTGGFKzgd8TAdURhrdV4R/+s8rNdoZzHAXdQEQ4XOybe9
         +H6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728568075; x=1729172875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P72PVJgi4uitEzWkX+CGhxiijiq09qyKhZsAdOcJJtA=;
        b=DOVp73mwd8JQ9hh84MOIumE+dMqI58yG925BiXb1cZxowSMCVq1VfWFieJh10zRi2i
         GCkPoYEmp8Rkl55xn9XQqTI6LvvfroBm9VQN0zCOpfnrsux6iWHlN78dHDvVzcAJOYOX
         C8tYVuhJBHKZBAG+NKUA0gbm8Rdt5oJ/0ipr1qg7esvemxJy7FHJN6JRI7W5Ob4rpknu
         DM57YKVXJflkhktISwAR0Gg21XLwxB42SXduYsdrko4TM8TRbzGrIGeu7jeDnoTugRL3
         I/oLUu78tfh070+sVZlr6vgxh9cFujkiz9M3cp5hYD2EsKQVRCdlLj6ndKDV7ifpMuKz
         QFXw==
X-Forwarded-Encrypted: i=1; AJvYcCWrc9MD9bedDuSNe2n24mo3bKxiig5IxVpkB6eISMuI3SyGQPeI1pl9pz6kqso6GdHP/aYSnIZt9cDh0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFjake/eEXQPmi6E9A78ey1+aFjrutMwp+truocwZxd9woOB4J
	LL8RRoAeiYh+QYyIKQVneJTEwm3VEVhP6z2BXzXaz51q/ZrCZddFWytuVRbEB3s=
X-Google-Smtp-Source: AGHT+IEjiQ58D2UdYLj6Yl92fdF2u466WimLIPKrNDpd4Kv0zCmXqRdfPWW59v1LOM5jtmbzLl3WsQ==
X-Received: by 2002:a05:6512:23a9:b0:535:6a4d:ed74 with SMTP id 2adb3069b0e04-539c496114amr4079862e87.51.1728568075061;
        Thu, 10 Oct 2024 06:47:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb9059f1sm255143e87.301.2024.10.10.06.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:47:53 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:47:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	agross@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org, 
	konrad.dybcio@linaro.org, mchehab@kernel.org, quic_vgarodia@quicinc.com, 
	stanimir.k.varbanov@gmail.com, kvalo@kernel.org, quic_jjohnson@quicinc.com, 
	ath11k@lists.infradead.org
Subject: Re: [PATCH v4] arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes
Message-ID: <asvhh4kzq6s6yz3wrqfmuolcnlonoobogoh45pnq4zdr44lpxs@zgarzpduk2sk>
References: <20241010132902.2882939-1-quic_miaoqing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010132902.2882939-1-quic_miaoqing@quicinc.com>

On Thu, Oct 10, 2024 at 09:29:02PM GMT, Miaoqing Pan wrote:
> Add a node for the PMU module of the WCN6855 present on the sa8775p-ride
> board. Assign its LDO power outputs to the existing WiFi/Bluetooth module.
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> ---
> v2:
>   - fix wcn6855-pmu compatible to "qcom,wcn6855-pmu".
>   - relocate pcieport0 node in alphabetical order.
> v3:
>   - add 'qcom,ath11k-calibration-variant = "SA8775P"'.
> v4:
>   - update 'ath11k-calibration-variant' to "Ride".

What exactly is Ride? Is there just one Ride board? I thought it's a
board family name.

Also, could you please extend the commit message with messages from the
ath11k driver, showing the chip_id / board_id ?


-- 
With best wishes
Dmitry

