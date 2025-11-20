Return-Path: <linux-media+bounces-47482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 17193C735C4
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 11:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 94D5834CE57
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 10:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0752D9784;
	Thu, 20 Nov 2025 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwvTwTuh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7602367BA;
	Thu, 20 Nov 2025 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632811; cv=none; b=OtQiDkZIgguJ4XFoRsi+PzXKjrP/isQ33iZaaSn/3I444Td2pPzzHRLWibbYRAqOOhvFzOAefpZAr12Afp+5lNHb78wjy4AnWEqI3ALmOl6JZuXGyfdzewwk8s8XhMxGVJaqVXIbQdpY6yNfuLoy10Bd7kUJ3Medbn5/5bCYZLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632811; c=relaxed/simple;
	bh=YOqMEz7Vce8ng0D/jOk1x2Q83YNT2JkrnXVo0KnDj7s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fi3KovgoX/IYUUer6izc1tlqGF849H+oFelDhYAL4NbzrnqkmFtdVAccRJ3qlmh6hY9AnmPJLw6nS/5qXKsGG1BPJPECFkaXkF7T5lANIuS+Uxcy9pjF62Y3UmsfFu+V9CGsNUlUSb9hNHx91bjQRi1KYk79KDeQyBJNH3emHPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwvTwTuh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8425FC4CEF1;
	Thu, 20 Nov 2025 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763632810;
	bh=YOqMEz7Vce8ng0D/jOk1x2Q83YNT2JkrnXVo0KnDj7s=;
	h=Date:Subject:From:To:Cc:Reply-To:References:In-Reply-To:From;
	b=NwvTwTuh/j0Gl2rh/KKBuN4FXpHCTLhmPbxuQxFiz41Guqcz/T0S1gxonXgKLvt7a
	 Cs4Gi8voIbTVTGBQLcuQOUYk3/3IzvAzBdMSvxTsrK9P+E5Lx0hCeQ5146QNcIuqBd
	 pKqtG7PuAPdntywVwptp4JvGEe3ApQcKMszqJB0zZKO7q44ilihJC489BtcYU/WhWO
	 UHOCxMcnjW/ueWnB7NvZoSx+75pI7J5nuodNbo6tYCP+B03OqIdANFzyLZ/b+7xB/V
	 SdDXCPdtAptKP4BidTkNZPE5fCu5ZB57lVueajF+jABxtTNOCc4Cy1QKrxcLBSUSEM
	 BollKtxiLlK9A==
Message-ID: <8bbbffe0-eda8-4ed3-be54-50360e4199ec@kernel.org>
Date: Thu, 20 Nov 2025 10:00:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: venus: flip the venus/iris switch
From: Bryan O'Donoghue <bod@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Reply-To: Bryan O'Donoghue <bod@kernel.org>
References: <10Ud2nacNpGLxEZdFk2VE6I40JkFU8f1S0lGFZayvkwiPgffhyV-gY3p_-AnMAAMckWDMVO__50mkrCB6NnyVg==@protonmail.internalid>
 <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
 <QNE2n_TmtAHnuV9XZ91kv4WczLkVkhy-FLRSeXwQUHN33qLCP_bUkF5Y5bHZm3GIdSViKwTGqnxY7EnZWTUJaw==@protonmail.internalid>
 <9c1afc08-e584-48a5-808d-16711c4ecd4a@kernel.org>
Content-Language: en-US
In-Reply-To: <9c1afc08-e584-48a5-808d-16711c4ecd4a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2025 09:58, Bryan O'Donoghue wrote:
> In principal

*principle

learn to type english plz

---
bod

