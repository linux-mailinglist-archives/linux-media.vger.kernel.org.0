Return-Path: <linux-media+bounces-8441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D8895E04
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 22:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 903431F24ED4
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 20:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9BC15E1F5;
	Tue,  2 Apr 2024 20:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ds96J6E9"
X-Original-To: linux-media@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF66612BF20;
	Tue,  2 Apr 2024 20:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712091122; cv=none; b=tjMLp5qfwP6pvr66KVvaP3O2IdaVW9E4BpYl8qCePxVjNWXLGurAvJ0zGNRpMjNII4YIrTzJ5jJGKaZtY+c7q+lTGfQCw1uw1NE98gikuYQnT9ytyQY+axzmfHvCf5dIGEf5wvfXMOMhIngrS91fvAKtKwAZ9sr7GVjGe2HMVVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712091122; c=relaxed/simple;
	bh=DNf89ITXfQe/mMUhZvAsREvsD6Vk7lf49Bff7tpSpcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KJqiVFher+2C2sSspB4hy+x1bh7JDSCKcJTIoWI6/coVJkQntGOWDtHt6pyCfXEsoknFq6h5QDeTcYsKtOtAE2yNWlQfrjFigZr+4udZoTeepJqBrlSqdy6VY+lDPzUQTF5X6AKfABu94V11sI/7X/vHIO6fZ/Qj5WNhhuQvNyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ds96J6E9; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id B9035C0000ED;
	Tue,  2 Apr 2024 13:46:03 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com B9035C0000ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1712090763;
	bh=DNf89ITXfQe/mMUhZvAsREvsD6Vk7lf49Bff7tpSpcw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ds96J6E9nVYEntWmNBfrkXAkgZAB/elAOQw6i7jKSW4Egx0MlNsqIWXI67L6hgBjJ
	 Zqfp3rn+ug8OQQ0KdpVYnYn619uqzcdFLr1re3IAzw4ZvXP92HOjN+OWQmGoszMFt3
	 siuXcozUEevXdzXIv/t8IBeCgstIS1fdkIB3KAoQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id BF21718041CAC4;
	Tue,  2 Apr 2024 13:46:01 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 08/10] ARM: dts: bcm2711-rpi-cm4-io: Add RTC on I2C0
Date: Tue,  2 Apr 2024 13:46:03 -0700
Message-Id: <20240402204603.2519971-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240402000424.4650-9-laurent.pinchart@ideasonboard.com>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com> <20240402000424.4650-9-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue,  2 Apr 2024 03:04:15 +0300, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> The cm4-io board comes with a PCF85063 on I2C0, connected to the GPIO44
> and GPIO45 pins. Add it to the device tree.
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

