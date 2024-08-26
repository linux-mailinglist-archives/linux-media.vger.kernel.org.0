Return-Path: <linux-media+bounces-16816-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2054E95F2FD
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C80A61F23364
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBAD185B64;
	Mon, 26 Aug 2024 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfFvFTjC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224AD13DBB6;
	Mon, 26 Aug 2024 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724679285; cv=none; b=KND40MYxNDZ6kTfsDaqHOYgPpBHsN0PlFo5ioq9Y+SwAG658h/+DdHMDTm3QJUeulSyr+BgXzP50HS6kVsi5EZxfzOybavDQ6Dw83xXnU4XpLbJmYBiTSZGHHFHwyAZ/cwLgipEqpMQVphkl3xaMlrb63pvlw4SACM1c+IdVHV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724679285; c=relaxed/simple;
	bh=1vNVZm3RuOHtSHsX35LnHADrFjU9GNLyHdfcBZtJHug=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EWh8VRFqevzkKlhErCs7P+Aa7a80psJl7yzuLcBggWn+a172tNi/o1hQ+4PooYhIOxIVoZBRjO+iIpeUYxcQBJ3op9iOriXvclOmpjoKA/RJE7JycBJMVOxodLApc7T/qGiOZGdaNNBk7SlmX2DFcoAXKzQEvdjlOE6VQSjCj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfFvFTjC; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5344ab30508so599200e87.0;
        Mon, 26 Aug 2024 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724679282; x=1725284082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhayvbickugtnI/gSdhlZbd6aElEpFdhIZRy3HzXNA8=;
        b=WfFvFTjCav6jJw8CI7gCjnc2yNEsuk/x4kyF5kq8bSJtIPZifwY2gUANPvgLBMQuH1
         9yYTiWngXIjgZ/jYbbYh5nCbKdzWU8Y3pfXf6s3gmuxr882q3SZWoaKBP1uu4nD4mR1/
         Q3E7XUR/sKJ3x8YmQpAjYmAcngYjhLKJrXOoFTYKAVrumEDTxKWeNTgRsyhSJ571Xylv
         LTentt+5SqWrH8V4uPSp/DjY2M67YAYHXtIxfaLzB73mCHukx8XSXnIn4Jz7sjH31Axf
         9xGcfXOKaJHOHUImaaeNkVc+kqSwpNtb21UyW6GzZL3Lc2f9aC0UCzWiVXnW4hVuj+TO
         RgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724679282; x=1725284082;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhayvbickugtnI/gSdhlZbd6aElEpFdhIZRy3HzXNA8=;
        b=esUq02vHucvXrWkHiGJqkshlGz1aWgUvicZNlHKxG6QBg7n+84dktj98Tqn/n4Ksq4
         6Wl9X7NrZRSJ5pRALcSwMdqp0Y+wektuvWALcCjc0JotCgE+O2W5iUg2hRf6++2VhkL3
         bNmYHh1jASNqwv7zoS9zo089Z54y4NCeaMU4hD+dXfbnZsumJXjhmNkg2iP/NE7cP/gP
         9bVfb1dAckz6HQzZs7dRj3kOHIqh5TEeQ1D8gfjd573atpt5Ac6e+uWuScGiT7E9q0wn
         2/Qlegx7EiFpYFqRaNR0rT8EkftuOOZL/ot8MeWwswqWThU+975Wz8p/YWVnj3rqhiW3
         lv3g==
X-Forwarded-Encrypted: i=1; AJvYcCUF/nNKsWoW46m4MiqLoRo+LLhBobBfhQ7V2MVkswV5KvAlIXV9vqfpLvin7yY1L1Q0X3k++I/e9RCCNQ==@vger.kernel.org, AJvYcCXmkwLQx6jGPZ5g+4g7BRoanmLm/YuoJyDD7TyWe+I3LEOhrPoFXRL60zZdRaUEUv5olBZ8Uy34f1DpWFg1Vmwmthw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLpwtV6ZHoU3goTsV/SKF8AvDremJM0DoXbjwjIQxZ9q0pHQs1
	s4d+a2TiykjRoOGI1kok/WNgmpcbvwpk36sV3UKRLW8sPCQ/tZQSeyu5N4pt
X-Google-Smtp-Source: AGHT+IFARPPf33n6hTYxTuY4Jj7ZnZQLt9uAcMoT3c9criEuY/VXXzr60PV9cxN3DieunHsbPhSOhQ==
X-Received: by 2002:a05:6512:b15:b0:52e:fa08:f0f5 with SMTP id 2adb3069b0e04-5343841ca53mr3549521e87.13.1724679281864;
        Mon, 26 Aug 2024 06:34:41 -0700 (PDT)
Received: from [192.168.1.105] ([31.173.86.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea59263sm1462328e87.146.2024.08.26.06.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 06:34:41 -0700 (PDT)
Subject: Re: [PATCH v3 1/7] media: microchip-isc: Drop
 v4l2_subdev_link_validate() for video devices
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Eugen Hristev
 <eugen.hristev@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20240826124106.3823-1-laurent.pinchart+renesas@ideasonboard.com>
 <20240826124106.3823-2-laurent.pinchart+renesas@ideasonboard.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <3bafe8a9-756a-40e9-a60c-e57e2d5e13d3@gmail.com>
Date: Mon, 26 Aug 2024 16:34:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240826124106.3823-2-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/26/24 3:41 PM, Laurent Pinchart wrote:

> The v4l2_subdev_link_validate() function is a helper designed to
> validate links whose sink is a subdev. When called on a link whose sink
> is a video device, it only prints a warning and returns. As the
> microchip-isc driver implements manual validate of the subdev to video
> device link, we can just dropp the v4l2_subdev_link_validate() to avoid

   s/dropp/drop/. :-)

> the warning.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
[...]

MBR, Sergey

