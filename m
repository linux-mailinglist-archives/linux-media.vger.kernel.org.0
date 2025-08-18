Return-Path: <linux-media+bounces-40104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 093C6B29C6C
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 10:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE5D204C2C
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 08:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3380830147B;
	Mon, 18 Aug 2025 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBbjtFNv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C161448E0;
	Mon, 18 Aug 2025 08:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755506265; cv=none; b=iQb64Vbz6A6IRRyvbzvrLxNzEWZILn7fzuVXVy2/LmNttW5StiIIQ0olx3wXs2OGaftdkPTcIUGquBp34kb4a0LyO9FECwj1CCBco8BmE27PA2ojy6UjUjOkGcHRAKyXejWTi58DA4/ekDLwdseNHu9/KFkxxk28lZ+0yWOGU8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755506265; c=relaxed/simple;
	bh=N8VnjlPRnKqu/DSwOnID5+bTt9B/8Ll0cRHObBmy0ng=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEVxwX6MYKUiMYo09McStLSOF+dCKBHC2WX0FvoCCWif6n+gY5z+XWBKjc005OG9k7Sb/D02GGb3QFzg6BVrbzqobPFpXn+ve3FO6sXvwzAwI1wMFWubQJJPpLphw+PUPzyqoMzafjnShNK7d+6YwxJg83FYRIxdB/eQLAWDDqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBbjtFNv; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55ce510b4ceso4437679e87.1;
        Mon, 18 Aug 2025 01:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755506262; x=1756111062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+SQhFuW5HpL3OJ4FWRgstFW2ENkzZUAlwMGpRfdru8=;
        b=aBbjtFNvWNnWh2mvjQTZP2svJt1IH8g/JDxH/LmwnnTw2j/SR4PEoTeFnzWsRuVHEj
         TimhYcvwYuYZXjv8R4eqxAHQ+kLE3KVgw5gwZ//ursPjxa2eoOFjKV2ostXNooWlFFdQ
         ig19D7jTqMeXMZMOaeZvs7IuFRWbS9dubglgzm/7gDWcM+uWLnBJv/5Q+LeoRkcp2kBc
         xUzgYhqX+lGHPbryFeLDuxScjfX8z9+DpeiV0IgEa9qQ7d29YTqdf/brH7gr2AV4RdPQ
         YTs0UK2DnztMCmiCdoKOy6wZ/5AnsBuPycw7qzYIsAspsmGSY2z8a4hGfNDFU0urevyh
         VUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506262; x=1756111062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+SQhFuW5HpL3OJ4FWRgstFW2ENkzZUAlwMGpRfdru8=;
        b=dsYCYc1LOWXNTPyFjKeiC9SGalXj1+O2zGrPRyq7eBo5wGITigQm/we4duzi6hhvc2
         F90Rpqhb6G/NPXItnQtP2bDBMcy2dVBfkG2F4CsgF3TWzV000rGF1XECzFH0roocdV99
         uYcz+N/peBPrudjr/g4COSA/CZctnnd7+vB1zu6AzNiS5PJP2XAlYCfLk7GhG6aXXWcy
         K17cbrP7b/HulcYphaEf1JPCdL6ApPKfwZhxgBRI4gCKLJ4NrrtPiSFXOPWLz+1g+he3
         SJDCAM1HHknwEvunjUO1MWPbqae6bMa/F07VTaTRdICBajiB9tR9JIoiSsggoVr1anMv
         E8UQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHuj7e5+OXkkePnXIJWaM9lA9aIOHGNXSkYMh+MezolqyAMr0XoGBTrUFQ0RE4bCUZuZ/vP0FkYnwb@vger.kernel.org, AJvYcCWecGcwpJsWfyeb/tzwaMRuyiW0nT2bhJZ0icr8gSi7e6hJoeXoxKuxLJAsqr5JJBJ4BHkt57tU6yVV5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFbdjpLa3xpYzxqnnH9ds+iDIzvTAKx6JTxKIQu7qn4Aplza1u
	1BPWa/qB/UUtlxMKuRLIo7NCQNDcEdj+aX6VSTK17PbYnDEEPZap7AMGIlDB7w==
X-Gm-Gg: ASbGnct5N49RuL7vSa44yITpZMS3zi1+fTnpWSl9lT5auoxgpxOnbSaJrzZzvs0yhaO
	vTOn9qzQKfc0bCl9gJBKnBCyjkQAuIka1widNvKhPUM8+qBuiq9fkh48Q8sUfbPOxYNMlAu4ebd
	yr1fPrJDRFrWpAFhxfbxQM5LUa4wpzi2TKIcZbluVQMe/Cfgjd8yDjry4naHp/3RjUcd5HS+n0Z
	YCUv/qLHbBjh9k7X+mprXMlu+wPyatj3gMVqj084SVD4p3hObzu0HJe7nE+CIOWfDAIuCXZ7mYH
	GmZnpDbRvKZIfQynFcNepLBwOHdWVARqm0n30JtAeP8HM47aZG3vYbGc0/DyMrFtOIhaufdURn/
	AgfNcMXRjj49p99Xz9Ga0jtMIm/lM04uO1+8=
X-Google-Smtp-Source: AGHT+IH8EWwSDmbDYhbwcw1H4Sve2jBWbulYVdOc5z1ZfHQvgKGrXE1heoo8VDNKPpg6c2fmUnradA==
X-Received: by 2002:a05:6512:3b06:b0:55b:8d6a:be86 with SMTP id 2adb3069b0e04-55cf2bef24cmr1689982e87.0.1755506261594;
        Mon, 18 Aug 2025 01:37:41 -0700 (PDT)
Received: from foxbook (bfd208.neoplus.adsl.tpnet.pl. [83.28.41.208])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef43e52dsm1601758e87.152.2025.08.18.01.37.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 18 Aug 2025 01:37:41 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:37:37 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
 gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com,
 hdegoede@redhat.com, Thinh.Nguyen@synopsys.com, Amardeep Rai
 <amardeep.rai@intel.com>, Kannappan R <r.kannappan@intel.com>, Alan Stern
 <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 3/4] USB: Add a function to obtain USB version
 independent maximum bpi value
Message-ID: <20250818103737.487e4093@foxbook>
In-Reply-To: <767ac1c3-f09c-47cf-947d-968ae574e577@linux.intel.com>
References: <20250812132445.3185026-1-sakari.ailus@linux.intel.com>
	<20250812132445.3185026-4-sakari.ailus@linux.intel.com>
	<20250813164958.6c6c34a4@foxbook>
	<aKLDXCchS20kaq20@kekkonen.localdomain>
	<767ac1c3-f09c-47cf-947d-968ae574e577@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 18 Aug 2025 10:32:48 +0300, Mathias Nyman wrote:
> I think the "ESIT" acronym (Endpoint Service Interval Time) is very xHCI spec
> specific. Usb spec usually refers to isoc and interrupt endpoints as "periodic"
> 
> how about one of these:
> usb_endpoint_max_periodic_bytes()
> usb_endpoint_max_periodic_payload()
> usb_endpoint_max_periodic_bpi()

I was thinking just drop "isoch" and leave usb_endpoint_max_bpi(),
because USB specs call this "bytes per interval".

But Alan didn't like this 3LA so we can get creative. More ideas:

usb_endpoint_interval_payload()
usb_endpoint_interval_bytes()


Naming things and off-by-one errors...

