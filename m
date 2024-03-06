Return-Path: <linux-media+bounces-6600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF4B87414A
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 21:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92B081C22266
	for <lists+linux-media@lfdr.de>; Wed,  6 Mar 2024 20:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AFA1428FA;
	Wed,  6 Mar 2024 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sonic.net header.i=@sonic.net header.b="kyUvbR56"
X-Original-To: linux-media@vger.kernel.org
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720A51420BB
	for <linux-media@vger.kernel.org>; Wed,  6 Mar 2024 20:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.142.111.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709756242; cv=none; b=CyyXn/RKpBS4TMLsq6sgi4ocMwqm7zbtRbMJn5FQ73mfIyMilypcuxDHLhUd0XJYLBTZTDJ7PY1KCHCDYz6VDoF3H0y9xMkqY5bLYE3wGG82l5Wkyj0lNa8LAcXo49y33vD+CqQeum2zY195XBTrhnS2X1WRuYe1QOr9NP0wezQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709756242; c=relaxed/simple;
	bh=r7Jgyq/XFKtBfi2pWSItxZO36Ogq70q4dIVsrxTw70s=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=uEGqm7eqrOcjbc092lJ8W9tRgO7TxY5/ekloBKEUL0/PvMzQY/Xgh9sZNvfenMuW/WKETbVyN6vxcoENZouBrnkTp2Nq/Gsinvte6ZjhmInw+eZCxp6pZe5244l380efd/Nx8bVMh67ixamqyq/t41Ig9hvvTfm/SBr4eLIqolc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sonic.net; spf=pass smtp.mailfrom=sonic.net; dkim=pass (2048-bit key) header.d=sonic.net header.i=@sonic.net header.b=kyUvbR56; arc=none smtp.client-ip=64.142.111.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sonic.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sonic.net
Received: from [192.168.1.2] (198-27-174-154.fiber.dynamic.sonic.net [198.27.174.154])
	(authenticated bits=0)
	by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPSA id 426KHHRg015677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 6 Mar 2024 12:17:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sonic.net; s=net23;
	t=1709756238; bh=K03ur6L45R8X/OCmETTQfv3HvjMkgSbIBP22LaWbsx0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:From:Subject;
	b=kyUvbR56HoSxDLrV5hyY75WxnYPW7VS9sYxI3ylCV2RUtC3fkoTYVNdWm9KlmfZkz
	 1nLg8Na+zMJQypfO2ce6YyaoTJA6wCls87eoJhc+TzpA5V/D69fyREScq1cQVZzP4m
	 DBcrEK09VyxeYCzgRcIiSyteWGCPpVq3X8qUr+UM0zwqWzuGIf2dOtOkvbcWJU6FeL
	 PEtqRCf1fPzSTaVZCGipRCrYxk/NDeajN3tnJtf9B8DPYVkM0rJncuuEbhKgFDMt7J
	 bi8sHgWXIJfUjGJzCPKL0Rf8GGJ1e95o85c689Y+tXDWCUZPb0r81Y990aYHwfvSky
	 N1fdObLq4vrDg==
Message-ID: <a008a571-86d1-43b9-bbc3-a01b73b778f4@sonic.net>
Date: Wed, 6 Mar 2024 12:17:17 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
From: ke6jti <ke6jti@sonic.net>
Subject: possible kernel regression HVR-950
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Sonic-CAuth: UmFuZG9tSVaJIZhSSH5j0sEsisdideGl40AOJH3d6bfVjJxlMZrpEcfTP9AWfl4ZiUIxW8sCkNt1r6mO8F6rFqYt5qGG6RcS
X-Sonic-ID: C;SLOHh/bb7hGy1dbXR+6Zsg== M;JJeah/bb7hGy1dbXR+6Zsg==
X-Spam-Flag: No
X-Sonic-Spam-Details: -0.0/5.0 by cerberusd

device :
      Bus 002 Device 002: ID 2040:7200 Hauppauge WinTV HVR-950

environment:
     arm64 using built in kernel drivers
     running on rock64 ver.2 kernel 6.6.16-current-rockchip64
     PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
     NAME="Debian GNU/Linux"
     VERSION_ID="12"
     VERSION="12 (bookworm)"
     VERSION_CODENAME=bookworm
     ID=debian


dmesg error:

     rock64 kernel : au0828: recv_control_msg() Failed receiving control 
message, error -71.

television standard:
     ATSC-T



Problem:

Running tvheadend with two of these tuners(Hauppauge WinTV HVR-950) 
tvheadend runs fine for a while and then freezes and disconnects filling 
the log file with the following message:

     rock64 kernel : au0828: recv_control_msg() Failed receiving control 
message, error -71.

This seems to happen when the second tuner tries tune a channel or scans 
for EPG.  It just starts filling the log with the above error and bogs 
the system down and will eventually cause the system to freeze. 
Everything will go back to normal if I unplug the second tuner before 
the system becomes frozen.

This problem does not show up in  legacy kernel 4.4.213-rockchip64, but 
is now in the newest kernel 6.6.16-current-rockchip64.  It was also 
happening with 5.15 kernel.  I was running Armbian with the legacy 
kernel and two tuners worked fine, but had this problem if I used either 
of the non-legacy kernels.  I am now running Dietpi 9.1 with the 6.6.16 
kernel and the problem is there. So, I am only running one tuner now and 
everything runs fine, but two tuners cause the problem.

Thanks for you time.


