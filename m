Return-Path: <linux-media+bounces-12083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6CA8D1A43
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 13:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 025511F243F0
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 11:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D7C16C871;
	Tue, 28 May 2024 11:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQFdbWeh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A5816ABC1
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897108; cv=none; b=a2WmzGSGFb2siuNwUOoP5VZxrUPNbZ+ufjNmgzbaq7birEWGzALmzntUdKNO3dU4VLz0kbdIBa6O+E4Bw5i8tjBdT/OBTwAQl56I9HUCsW0d03DV2QLlAhdP9hwj+24/8iPCXNUWGwVVaOHnT40j1U2GLHzRv1H7HGjdK8tPNug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897108; c=relaxed/simple;
	bh=36uSHoMgxGER9AyqV5VeBnVW6VIdtXGcTbVwtzyKn44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p10Oxz/wqA2Cm7gmKtvancSgQ6oRiozJdQ4cpJvsXkOZAc0nL+T9CVoHFK/V0pb87wBbkItUhEW6YRNz78lhp9Ni70Jt9OyvWTG2RxbxyhJ8urDdPPx/vjGcXzLVOxTuBI08Nseecp/pCmRtqTJ38tv8gElDYNbXiplzCxjmyic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dQFdbWeh; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-529597d77b4so885308e87.0
        for <linux-media@vger.kernel.org>; Tue, 28 May 2024 04:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716897104; x=1717501904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SR0swcG5+QwWCJaol74s1Py1ngSe4OivircoLN7dDJU=;
        b=dQFdbWehASHf/tLujjkM/47lteoefuZtqD5HGb60XiOhOQk+YBzrjbSqixd/SLTKQ1
         RL72TDdx7kDYyJLlmdY8HYfNRUK2QmX2TuqaTDvBiB/gHhu0nIXLqhKXXa+JU4lgyTwv
         uVvMzpuAAsbhJVxkZ4o1eubOW4vr/Orp7wSU5izS6Xqpf6rrEenleC4pIDKTP+fRMVkL
         nZewdk3MqlcfHd+ehT+LhP/UKPjkX8pdry9kofOM4YagsyjszdAka9JtqalmsPgeAKJp
         LPG/4+T7I2nkS+k6DOAZDILc0E/MSZQTcbh/yBrIQCT8+KV+iOdl8pD0Felfob8xRrTQ
         zl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716897104; x=1717501904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SR0swcG5+QwWCJaol74s1Py1ngSe4OivircoLN7dDJU=;
        b=E1iqizYLpa6BBZ6f7FWvrFVhCHaF44BWWZst0RzWXOmVAOP4dhXZGB7YUHjrUhStp7
         QaP48fguH0ZnvJ/zQ78m1+xB5aB9HO4IWMzEQkjsy36JIBue33ObtE8WnhwACKMHj37M
         PAdUz1HKhGZqXaZbxiYq/WyfasuWww182aFRIXKJvkOZpo7WJ5sWLaYhH34YXC0aK3gk
         v1Oa2omVPJzvx1CwJChGk/GIjyssetWrauc2NIFHxCIPxEQdlHfmcOeumJljEiA20TII
         8FpMXhO94gP0fAMcw5xQc+NfEcoLWILtu8PehgTygJE9kGHXhK7kfKLeAxfa0BsxAnOm
         kTUg==
X-Forwarded-Encrypted: i=1; AJvYcCUo2fSujVk/0jPW1CcvJSsp++I6XT/3ak/T2bKLIOZ5euMyMsotzqW7XNGqohZ+MeA3nvGc1DACOp7/Ik1EsTNU5Vu9gXqwmDqu/R4=
X-Gm-Message-State: AOJu0Ywez9RR0QiifJWKrbtKh4dLU0ncT9vEp6N79EDYj6v03tgKZK3h
	lB8b40i8xgQpCJz+kL5/iumvUqnKYmCyiOQpzFytZJ1mO2G01wGM09IpDvvW/mQ=
X-Google-Smtp-Source: AGHT+IGtydr8Q+QTfb3HjbwnRs05//k8mxj1FHunYO466H8ygyz2l7N2XNJD5XCJREFfSTK3smXiaQ==
X-Received: by 2002:a05:6512:3448:b0:51f:4096:dbca with SMTP id 2adb3069b0e04-52966ca92d9mr6185096e87.62.1716897104488;
        Tue, 28 May 2024 04:51:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5297066b68csm941610e87.132.2024.05.28.04.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 04:51:44 -0700 (PDT)
Date: Tue, 28 May 2024 14:51:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, MSM <linux-arm-msm@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: msm8998: add venus node
Message-ID: <xlsho2uayeay2yzws77donp7xrhwxndv6t6ehobevaszah23l2@risstyo3vhhv>
References: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
 <c2fca6c7-2421-42b4-a43d-68b251daf9b4@freebox.fr>
 <e187c5ab-0241-4a45-8d74-a33ec12deec6@freebox.fr>
 <b4a71be9-b888-4396-9eef-28c4a4f2b149@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4a71be9-b888-4396-9eef-28c4a4f2b149@freebox.fr>

On Tue, May 28, 2024 at 12:49:54PM +0200, Marc Gonzalez wrote:
> On 13/05/2024 10:51, Marc Gonzalez wrote:
> 
> > On 07/05/2024 11:29, Marc Gonzalez wrote:
> > 
> > Hello Bjorn,
> > 
> > This patch is supposed to be merged through one of your trees, right?
> 
> Bjorn, would you take patches 1 and 2 in your tree?
> 
> Who would take patch 3?

Per MAINTAINERS:

Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer:MEDIA INPUT INFRASTRUCTURE (V4L/DVB))
linux-media@vger.kernel.org (open list:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER)


-- 
With best wishes
Dmitry

