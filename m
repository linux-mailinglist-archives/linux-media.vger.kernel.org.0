Return-Path: <linux-media+bounces-34542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B3EAD5EF2
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 21:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FA8E3A875B
	for <lists+linux-media@lfdr.de>; Wed, 11 Jun 2025 19:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6B9288CB9;
	Wed, 11 Jun 2025 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKU7pHaD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6B51DD889
	for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749669752; cv=none; b=bWkKcLoRPpSwCfOeFxfVXVmZz5ARMzCQi/id+LMoetNQ6a6TqWhu2/9aFAhC4zldRoWD97ruow8CcbbDiYSSpljsP/C2kmjLfWPYu4VVBoBEXQz7no+vhuiq5vqTrOnCTcLg9nfY3P0ix20MEwYn3Z9u5d7IViKaPExllvWVPZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749669752; c=relaxed/simple;
	bh=vAgeuNtl8mlv8GuWfs9SSMfoFYm+561BSY1s98CoWH8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/OSzcYtEj2pt5ZcfFe7mP3cupVoTjCWV7uXb8rh7sIM/gUdqDJLQv4HqYPyTuKVqdNyzMwU4REo9gouR71t9p8uDrveD4GpWSva8POp7ZfxbnJzcOQOHwW1ZS1ktHoIvWJNs434+ch5KltiMs2CFgKYpSirOaNYDZgz9bXbats=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKU7pHaD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so944455e9.3
        for <linux-media@vger.kernel.org>; Wed, 11 Jun 2025 12:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749669749; x=1750274549; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDO9w8UUoDvArDAYv/Uy+ekA6fS1XN7Tfe09KBQMX20=;
        b=fKU7pHaDjaS0lYRBoVFMt2+FStANyvQP+YSMZaqvNWW6Pu0gMSxOYSIH2ZCq+c95QH
         KjZ8I1ijaXF7GQTEdaX+TXVwGJpG2gdh6UFpTRqxmB3Q2lNJXvjcR0CfxXvi176X39AK
         KQuz9UuyxEd87+4MxDcOdzFXjZYe4LcQrHiGXZ+R4o/7C5bbZPV0CPU4cwv6uYcHY+Rd
         ZbSihmQYS29SovFGkMcCjCeT2TBg6OWEM+Qk55f/qJSPESbOpZmSCd7mDfqjjuAU39yy
         sN8Vjrm3z/xGRjQvidX2C/uXHkSvbzLiqCEo90rexijX52JDLmYxQB1lS10pIf/PWwwL
         uY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749669749; x=1750274549;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDO9w8UUoDvArDAYv/Uy+ekA6fS1XN7Tfe09KBQMX20=;
        b=FJ2CdJuWuhmOfZVmU0m4AXpqYMxC8AGosgxwobCw8m9sqxZMNgE/ySjDrEDCiW0XvH
         5nDTUN0eB87rrCTO6/vZOitTVqHXB8KDnAXpbXoYENy9c4mIXwheLxyGfM213uLn4ue7
         Pz0ZXEqIEOVmeJ2Q4mXdj8bgLnQio8DXm4oLj1xcShEV/AAno9XftyMBsPtuQ8lgSCpp
         7PTtwFjGqkwzfI+EIlIcs4HDbFjOkju0bWF/8aiNJmZ9/DBLwmxNt2a9srk2j/wzyMKk
         i9umddnW7+FZ+I322FLqPks+N4ryN+b8UVxyC+kjkFvtjxInnTpTZwkCwiZ7obBZlkVr
         hw+g==
X-Gm-Message-State: AOJu0YziQfs9wljMprjI6jamw1HocE8Y0f8wmnX6Es2aTejZRMzANz4U
	MidjXNh4+rnHE8n1AjbELcLANT0Rjloz7p53430LaUOKR5+OzWOq0fE39ev2yHrs
X-Gm-Gg: ASbGncthURZrb9dJX6CdQJzfoVqHn0EDx/eryggL9imGKsZvL7s6dzBjlnZcf+GVy0H
	/Im3sNxJaBx++HsUOEzKb9DSD0i9Y9EBFgDnkPRvsi6z1GKh7nic8kLR0imTW3VDv2bdX+zZI5J
	R6ezP8p/ttxnOJRAfGlogYmbI9PisFxMbyX44RzW6A8Sz2cA4uStpnPl5WLAB7Z4Oy5JH5PQVw2
	KLnNndJqd1YkPmfxmqvKJdRcDrhRcYsXMktkAnfT6JeLf5GxewZWH3VeB0WI0Kp+Zk+47jzIhet
	aa8sgBCvgCjEN3NIl398eHZjc/JQYsKANoWa0LTpMm0ZStd1nVhpbByMhdpagURdmK1yFSUPTOl
	ZfRT0z+YDoPPN6yN1Atlww2WpFv5h7YuMGkWWISJJePw=
X-Google-Smtp-Source: AGHT+IGazBUB8UIgs1ZKJA9P9tsny8kCDMe5zyY+y/tz76daeAy0LGsAgDl/Xnn4Zub2ugxydWZ03g==
X-Received: by 2002:a05:600c:c16f:b0:453:c39:d0a7 with SMTP id 5b1f17b1804b1-4532b89f884mr10049945e9.5.1749669748812;
        Wed, 11 Jun 2025 12:22:28 -0700 (PDT)
Received: from solutions-brol (243.79-78-194.adsl-static.isp.belgacom.be. [194.78.79.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532513ddc3sm30177915e9.4.2025.06.11.12.22.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 12:22:28 -0700 (PDT)
Date: Wed, 11 Jun 2025 21:22:26 +0200
From: philippe baetens <philippebaetens@gmail.com>
To: linux-media@vger.kernel.org
Subject: [PATCH v1 0/1] *** New MIRA220 image sensor driver ***
Message-ID: <cover.1749669197.git.philippebaetens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Folks,

I've recently created a driver for the ams-osram mira220 image sensor.
This is already merged and tested specifically for the
raspberrypi/linux kernel.
Now I want to upstream my driver to the mainline linux.
This is my first patch - so be gentle :)
Feedback is appreciated.

philippe baetens (1):
  media/i2c: Add driver for ams Mira220

 drivers/media/i2c/Kconfig   |   14 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/mira220.c | 1998 +++++++++++++++++++++++++++++++++++
 3 files changed, 2013 insertions(+)
 create mode 100644 drivers/media/i2c/mira220.c

-- 
2.34.1


