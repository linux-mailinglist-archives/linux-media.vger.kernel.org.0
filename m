Return-Path: <linux-media+bounces-8439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63413895DFA
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 22:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A97C1C231C4
	for <lists+linux-media@lfdr.de>; Tue,  2 Apr 2024 20:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E524415E5A0;
	Tue,  2 Apr 2024 20:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LrnFhNod"
X-Original-To: linux-media@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E7F15DBB5;
	Tue,  2 Apr 2024 20:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712090779; cv=none; b=aJy9LwOyCTi5a/887wIINPnWZxfZmFKvNu7QP2UzGum1wi5cruXWVyEmTR4rwGcakXSBS10lXBEaV4sW6V+QiVbrwbHp7Ag9GqxEFpABk4/SVk/vvVSw/6JrycpDS9ASSmLp5h5S6kU59kL/4TdrhAFFHIDCneBavjWIxBipRNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712090779; c=relaxed/simple;
	bh=Vjm0A+2LOPX3xs2F3WRXSoHlW9i5s4vDVdhwweUFrQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KROISuErPi3PeT2NxLaxNVP5HSNH2fbKOQm+lTqmEPjksPyjV8E6c0IIzgVxYyC8gEoFBsxGNWjnOabMq3qqpYSqP/9AP/fZxaQtyaeAPY2ZR3OMb4NksYO97ssvEODPhJ7UE/UXtJDgTG8ugCtL3lianNm/pML1ziq0Ci84jxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LrnFhNod; arc=none smtp.client-ip=192.19.144.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 64968C0000F1;
	Tue,  2 Apr 2024 13:46:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 64968C0000F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1712090776;
	bh=Vjm0A+2LOPX3xs2F3WRXSoHlW9i5s4vDVdhwweUFrQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LrnFhNod9oWEL7PsES6s8ue5XnICH895bXIWA9mwYE5XGHjF4x09wrMGdW63+Dley
	 7nubrv9kqXRlffyhDV/nbpRpIpfuaqNVIgzOVrhgK81aLJW8I+Ucir2oJiQG18UyN5
	 2+diOtlI0j+xxA7WT8JIM4d6AE2pavCYkqUNzmys=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 6D74318041CAC4;
	Tue,  2 Apr 2024 13:46:14 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
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
Subject: Re: [PATCH v9 09/10] ARM: dts: bcm2711-rpi-4-b: Add CAM1 regulator
Date: Tue,  2 Apr 2024 13:46:15 -0700
Message-Id: <20240402204615.2520062-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240402000424.4650-10-laurent.pinchart@ideasonboard.com>
References: <20240402000424.4650-1-laurent.pinchart@ideasonboard.com> <20240402000424.4650-10-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue,  2 Apr 2024 03:04:16 +0300, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> Add a fixed regulator to model the power supply to the camera connector.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

