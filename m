Return-Path: <linux-media+bounces-45577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D22B7C0B0BE
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 20:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89B0E3B5B06
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 19:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A743F24A079;
	Sun, 26 Oct 2025 19:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vygLbYo9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6115326CE11
	for <linux-media@vger.kernel.org>; Sun, 26 Oct 2025 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761505564; cv=none; b=jIdVh6S4JWDPaR8BSWNiSz6D8I12Tk5eqKLlTDA4R9hncqWz0OvJcJ9psLVCQ2/PiEEcbG0vnZobutInzmyiPxmLWnWNLTMmO+z/GG7pd5hjOQVb5K8uExrQ8WW7j9RUqcQvVU9Jls40XiU3hDGJx/i+HoBEVoEckS9W7H9di5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761505564; c=relaxed/simple;
	bh=th1ZtWlZtq2jND3L9Um4As08DGJhTXtwGc5UK83poPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfTpiHUG+v2g+dnd/TGMq4yl1v5w+E+amimXpt8y6Q1HABeeh0sA+jHlEJtAGFEl36+lCQh+RIZ7o1E8kHYximyWHO0luluqoiGDLtqbgamK0hWfkyInpgH1pKlgUmfhSXtAK9yMpxJBrR/Dzj9vZbZ6WNEx0OjZUT8xuAdg0JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vygLbYo9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42966ce6dbdso2848807f8f.0
        for <linux-media@vger.kernel.org>; Sun, 26 Oct 2025 12:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761505560; x=1762110360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JxAGfxDoeTCVa/M6rSIz3dTSkpIo2EUGND46i603cvA=;
        b=vygLbYo9RuTtsydonAk3pa6QyocI/vTsRURycwkfqGi4nXKoE2m2lv7zwuzAEpr/G+
         7Ppr+SCWUfXh/bzCMZngMvkBald0p9Yde6u01S9PiwcHGXgUBN6sFHAi9kNfn1DSBzdH
         h655HWHq/gYTGeqMpJwi3oesqZIIlzCd//OhLXkZd+ChGEsEhtBlDj2HzWbibWDtCthe
         sILA2hAdqoi+xBLFm7R1ZzSmZV/ULVRi1A+E6+6vauXjWjOCfJP1a0eXwCrtPJxaumwr
         rWVmis4bDz9sUa6Tp5whhgTOLAITvfRrP3WBpqR3N8/aghMvnWWjhnTYISuz1QXENisP
         hwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761505560; x=1762110360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxAGfxDoeTCVa/M6rSIz3dTSkpIo2EUGND46i603cvA=;
        b=Vri0pQDTZKu4TmoPghnOYypQ9Nfc+a91069QTsvLFMOfo2yJnv2Vb0PMbeTELwNeAk
         qMQDsWmyhSeHPhTee92lrPBTcG0HSkglDQJWflHXlPshordoSbzCG/qHa+h4i+rdXOFn
         Wd6cNumjiboh+jszOuqhqxwtzU5aVHcyQV+BKHfcqsG3N5pQXo3jtfiIEqgGRGSeZaQF
         3iqlKrfKd6nQ5YajId1OpyqQvN363HdsT0vjYXYfwrkO+sbIc79VzyoeDHBA2+RJv9gV
         dNHxyPl+zd5U4/Mnb76y/mMeJgxJqJAbQpNUoFRafNqqQrSJBeJRc3JbymaFimK4k2EM
         wRhg==
X-Gm-Message-State: AOJu0Yw4F0dHFXAc5t/ci5P/1bE2sRdX9hlDc8xXFAgIYh17MuYgRbQC
	vPI6ADIQr433YEO7P/E2X4NS5gM3OWFeYfGem21v/EsbcnwEecoXxjigcBTi00aq8no=
X-Gm-Gg: ASbGnctXYzSjwKLv8lw4RlOf6eE1IoSEI7B42BTcBB+jQI2yPLBZG4BPPJctIAeh/Gh
	lWRwIBZtLuuSuz3sz2+oa7uggGnd4nAb+ZDgkhf8bknnkmn75Lu3gRnCyocsmZMkAqY/QIbxGbT
	WBk7jKzrrM41RgXzvgOQkTJqwTRMJ+p9sFg1V1csodUJsjfQMWU0AbIOqxq03V382q31/ahjDeB
	aOnlggWDETjOUQVLKd/pPsOTyXiDjnyVLis8FI0ywI2AIQDR6aaiA5Davn0Fh5GtQcHw5OaHc/K
	7MEE7Mgu/nw8zENURVnL30P5iOOAX/hSPSAl4yb5nvjFH6XPidwIJMKDLDx6PAnMiw3TaPEtYII
	AI3egKPm5A0lYliKNFdq5y4eiuXRcMqfVgPvYDdQULAzoXUfKuXUpYzqnRd3AiSLguD+q8Wup/t
	9KjzYKiLY=
X-Google-Smtp-Source: AGHT+IE8SiE2nOPWBT1SDIBvc0CB5GW5Usu9sWArZFnGhC0jdaaIBNtRWS4NERHC5dfjGaaI02Jlfg==
X-Received: by 2002:a05:6000:18ab:b0:429:8d0a:8108 with SMTP id ffacd0b85a97d-4298d0a8213mr9705765f8f.24.1761505560384;
        Sun, 26 Oct 2025 12:06:00 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df473sm9985453f8f.42.2025.10.26.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 12:05:59 -0700 (PDT)
Date: Sun, 26 Oct 2025 21:05:58 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH] media: qcom: iris: Constify iris_v4l2_file_ops
Message-ID: <q3gfnoogax4hzzamk3hn5mc562ub44thzy4rfytbehzfjbguxv@wlwnclakophi>
References: <20251026181138.13387-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026181138.13387-1-laurent.pinchart@ideasonboard.com>

On 25-10-26 20:11:38, Laurent Pinchart wrote:
> The iris_v4l2_file_ops structure is never modified. Make it const.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

