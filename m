Return-Path: <linux-media+bounces-8442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A543895E06
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 22:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AF9CB24993
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 20:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F94E15E20A;
	Tue,  2 Apr 2024 20:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IcrhyIA5"
X-Original-To: linux-media@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CC212BF20;
	Tue,  2 Apr 2024 20:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712091125; cv=none; b=NVJlQ6R1Ly6m0kP20RuUulSizBgFSKmuXvhq5Nr/wd8Tr+sbwKTxNr50zJDRN08ADMiBB2pDQ23LyOQ31PACECIVWllj2bULv0E/A9g68UCMHj8Q+4uMKAqAtZe77ZJkVs5uqKstHHxs+VR91hKtwqoA3JFZAxzi8HC+JaVDOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712091125; c=relaxed/simple;
	bh=LwKYC+SZUn0nHRmzO7S4TAKdn59+AOuO2pF9oNCk7ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XmD5lrv4DEMlH7NQXHOawqztoaXKj4ea0P2zfZfp9zWdPuSQlzNe2KmJS+Y62ioS2QnxnYD2OPFLsL4jRej+dbNMu8CcXKZhw02obBWnbHr4xOUuUGsh+rQ1P2dch0v7pCKvcaPhFjSCIoequWDSOWDItPVAGmbnlIFcJfuGzHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IcrhyIA5; arc=none smtp.client-ip=192.19.144.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 4954CC0000E4;
	Tue,  2 Apr 2024 13:45:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 4954CC0000E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1712090750;
	bh=LwKYC+SZUn0nHRmzO7S4TAKdn59+AOuO2pF9oNCk7ig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IcrhyIA5gUQT2ev/qUNmmH+1nLTsOCb9htDgftgQ2/dMb7VSSyaPGRHSlWmEzNgt1
	 MnMsXtuQRFdvo+0ss5ReY0LoVxNqTWuEFHyYUpWIlA1Wqsy4tkalWsomcwomkJbK7n
	 j/puujrwTkynGgCgLypj2Qr/Izns/5AuJfVaGbd0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 658D418041CAC4;
	Tue,  2 Apr 2024 13:45:48 -0700 (PDT)
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
Subject: Re: [PATCH v9 07/10] ARM: dts: bcm2711-rpi: Add pinctrl-based multiplexing for I2C0
Date: Tue,  2 Apr 2024 13:45:49 -0700
Message-Id: <20240402204549.2519879-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240402000424.4650-8-laurent.pinchart@ideasonboard.com>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com> <20240402000424.4650-8-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue,  2 Apr 2024 03:04:14 +0300, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> BCM2711-based Raspberry Pi boards (4B, CM4 and 400) multiplex the I2C0
> controller over two sets of pins, GPIO0+1 and GPIO44+45. The former is
> exposed on the 40-pin header, while the latter is used for the CSI and
> DSI connectors.
> 
> Add a pinctrl-based I2C bus multiplexer to bcm2711-rpi.dtsi to model
> this multiplexing. The two child buses are named i2c0_0 and i2c0_1.
> 
> Note that if you modified the dts before to add devices to the i2c bus
> appearing on pins gpio0 + gpio1 (either directly in the dts or using an
> overlay), you have to put these into the i2c0_0 node introduced here
> now.
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

