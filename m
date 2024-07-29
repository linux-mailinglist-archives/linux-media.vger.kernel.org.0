Return-Path: <linux-media+bounces-15460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 150AE93F70F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 15:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 687B41C21D70
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E5514E2E2;
	Mon, 29 Jul 2024 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VzPyN57C"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7224146D54
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 13:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722261208; cv=none; b=KePFtbr2PenZUj7ML5LNkJhObT5UGL1NS9joHKJ9tKsHmowA8N5blgzv9vbBrTkZMjWx2LkI4detmisezVosg4pad0qCg7PX/XxrDTBlV2FFYP4nURXo/HoWylr5sYmHgOa5R2zkuBLSSnl1TbVzyq5oQBSr8MZVDcRA2Na5o8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722261208; c=relaxed/simple;
	bh=dnE7em2ypkViQjMc8OHZFBqmnlEZ27owWXUfkmLufXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A28GuQplvV4mGOdjqiS1yFVYCXk4wue54PwIMudqkdODiWqD95CIoq/Fv06NaDmR/V30e68+bvuprIHxGGBGFvW19glDxYZotnC7btwPZrnRouhGJjNoiWDfP/yIts5LqJDYk9+T0pY50BTM2FYxO2O/hk+bwOGlD91Te4rWTcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VzPyN57C; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5a15692b6f6so5795040a12.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722261204; x=1722866004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnE7em2ypkViQjMc8OHZFBqmnlEZ27owWXUfkmLufXc=;
        b=VzPyN57Cp3xy/ShVYsxphaNRDZXXWKep7LZw1ENcfQgjg/mVHAboPOcvd1zXUd5f4Q
         4/Q1epI2w88B44M/BVpikfjO53YJF3sOZo4RMPkF81enL9ZREJ8HBVGVB7oXde8H/BEW
         VE7frBWkP99+JIKZGZO6bCWA2eqeZYkxOvg96pm1xD8dCX1a0D6N8rODx6xkaxe+sc9P
         MQBl17BdmKCo0wh3ELtJp9fb1NVvVgCoQT2GlpMmYP25hT3PodFiKmbc5TOxvcTL1eoI
         US0szw197QMpg+MV2HNXJzSzftuw1ghIEqq1C+BwDy8RGNACuMae4tmRxlYqNtkYmW4y
         cPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722261204; x=1722866004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnE7em2ypkViQjMc8OHZFBqmnlEZ27owWXUfkmLufXc=;
        b=kgIahnLiL6Dfi2T0MCE2WIXmJ/mok5DeduFYuJ8XVEs67b5B6H6VUNSRYVl4/Z6S8X
         OFY6N7um2ZOaKiZC1tzqv6gIvNo/MmUphJYQ2b2frLgBR+xXCdKrlFAINKlVAOADyFea
         tbbVtC1yMhUNEDXsq945DZuaJN9rL6MjS8iVoGA9B94wETtyc/k0kMSjNypLbY87EMRM
         9c+aXb8tU/0yCt2HYjBJb8pwz3FGkImzwvXwZx2UHquKkFWdPEakv6+793iuuXka7LDV
         bj2GiHgV0colZMTUiU47UNFUncXl8/Qez65dVLNnLpxzL27wo/xpc6B/g1u/tLZFGcKz
         q5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUWP0brRgWS8+XGmHubvP1vmJOHnGnAQrAGTQKpMhHc+PzmvCqG9gWMd8IHqE77h7MUJqma3G7FfzOuCui1iZ7vHmykULkdJwGa+Rw=
X-Gm-Message-State: AOJu0YxmZwfIXYkDIgzL216r98Q1+Xj9vvbYxYUsCYNMLCFIKVigkADd
	qoaG8GbD5b7RmRftG67nC2bEMnW+o/osVMu30RSkEbn9Lu4bCikv9Hjq46ZcaW8=
X-Google-Smtp-Source: AGHT+IFZIjCnuFL/gyg6Z+QfFIQbM2gHgpmYLewsWWJFX2oRFA20qyP3bxO2ggIhAZTwb51YgfwzXA==
X-Received: by 2002:a17:907:9604:b0:a7a:a33e:47b7 with SMTP id a640c23a62f3a-a7d401d0deamr414935366b.69.1722261203882;
        Mon, 29 Jul 2024 06:53:23 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acac60369sm509391466b.90.2024.07.29.06.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 06:53:23 -0700 (PDT)
Message-ID: <41dcc3df-37a6-4932-8ed6-9570a9b4d9a9@linaro.org>
Date: Mon, 29 Jul 2024 14:53:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: venus: Helper function for dynamically
 updating bitrate
To: Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, stanimir.k.varbanov@gmail.com,
 quic_vgarodia@quicinc.com
References: <20240726213811.562200-1-frkoenig@chromium.org>
 <20240726213811.562200-2-frkoenig@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240726213811.562200-2-frkoenig@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/07/2024 22:38, Fritz Koenig wrote:
> ---

You've omitted a commit log here.

---
bod


