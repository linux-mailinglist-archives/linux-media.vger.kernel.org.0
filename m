Return-Path: <linux-media+bounces-24748-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A349A11BCF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 09:25:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95CCE7A42F3
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2025 08:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754392500B1;
	Wed, 15 Jan 2025 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redpill-linpro.com header.i=@redpill-linpro.com header.b="NyfJjTVp"
X-Original-To: linux-media@vger.kernel.org
Received: from frontend01-osl2.zimbra.h.bitbit.net (frontend01-osl2.zimbra.h.bitbit.net [87.238.49.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DC524025B
	for <linux-media@vger.kernel.org>; Wed, 15 Jan 2025 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.238.49.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736929524; cv=none; b=Z0+3eCG848aHcNJl3u+c+IzAUXq4OBBgkMkO07behqktmSS4fesA2wCmwpj+rQeBInZEdAtepydgn/woPXAOFYMdmyHvchVQFmuzbhIvFFM/llQcCUN1n+AH8hKzNTIGZiXJBSV/xQPlgl1uO2dzO13F1y/jekH074uiF3nOb1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736929524; c=relaxed/simple;
	bh=GMxEVADxwgiBStN+bklYGZgw4lKNrnwtapKqjrWi+hg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h2klIgGgvyOvneWfGY/VVPkWQJJw6pzy5Cy4nw26d5Bq9zZ2w7mNbxYRPRTWwzpcZ8fswjEDcTvnmgPSv5tr67StSYCRojo4PCixIfGpqwjc/g79MyruG6Ql0hnIxYv0utOoW271adm15+XrnI7tB8XfrnlDa9rMmJ+Uwu6SPK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redpill-linpro.com; spf=pass smtp.mailfrom=redpill-linpro.com; dkim=pass (1024-bit key) header.d=redpill-linpro.com header.i=@redpill-linpro.com header.b=NyfJjTVp; arc=none smtp.client-ip=87.238.49.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redpill-linpro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redpill-linpro.com
Received: from localhost (localhost [IPv6:::1])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTP id 7445860008;
	Wed, 15 Jan 2025 09:25:20 +0100 (CET)
Received: from frontend01-osl2.zimbra.h.bitbit.net ([IPv6:::1])
 by localhost (frontend01-osl2.zimbra.h.bitbit.net [IPv6:::1]) (amavis, port 10032)
 with ESMTP id oJSTqX2Cqtvv; Wed, 15 Jan 2025 09:25:20 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTP id 54BB060912;
	Wed, 15 Jan 2025 09:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 frontend01-osl2.zimbra.h.bitbit.net 54BB060912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redpill-linpro.com;
	s=612BF5B6-589A-11E6-A0CB-300C70828C2A; t=1736929520;
	bh=GMxEVADxwgiBStN+bklYGZgw4lKNrnwtapKqjrWi+hg=;
	h=Message-ID:From:To:Date:MIME-Version;
	b=NyfJjTVpJzg2GQPxkeEotMur4H93uSPfYkOUw9eo1IETlYOptq4UDG5WXqgvgKadZ
	 IyrXvGcIfiMG80i3EZa6u0MD/pmvLWG0ybowUMqN4UUTGxCzCePrFoySmPtx1xjL5p
	 rehqDK9ORY/TJddAch5Dl3KkPRPecbiBjH1u7JhQ=
X-Virus-Scanned: amavis at frontend01-osl2.zimbra.h.bitbit.net
Received: from frontend01-osl2.zimbra.h.bitbit.net ([IPv6:::1])
 by localhost (frontend01-osl2.zimbra.h.bitbit.net [IPv6:::1]) (amavis, port 10026)
 with ESMTP id rdn01stehiwv; Wed, 15 Jan 2025 09:25:20 +0100 (CET)
Received: from [IPv6:2a02:c0:2:7::7] (vpn.i.bitbit.net [IPv6:2a02:c0:2:6:18:59ff:fe38:da0d])
	by frontend01-osl2.zimbra.h.bitbit.net (Postfix) with ESMTPSA id 2D61160008;
	Wed, 15 Jan 2025 09:25:20 +0100 (CET)
Message-ID: <c91e0a27bcc5aa2af03ee499a6abf58601548625.camel@redpill-linpro.com>
Subject: Re: [PATCH v6] media: i2c: Add Omnivision OV02C10 sensor driver
From: Ingvar Hagelund <ingvar@redpill-linpro.com>
To: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	sakari.ailus@linux.intel.com, hao.yao@intel.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, hdegoede@redhat.com,
 joachim.reichel@posteo.de
Date: Wed, 15 Jan 2025 09:25:06 +0100
In-Reply-To: <20241219175128.40871-1-heimir.sverrisson@gmail.com>
References: <20241219175128.40871-1-heimir.sverrisson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thu., 19.12.2024 kl. 10.51 -0700, Heimir Thor Sverrisson wrote:
> Add a new driver for the Omnivision OV02C10 camera sensor. This is
> based on the out of tree driver by Hao Yao (...)

I have tested this driver on a Dell XPS 13 9340 (0C87). The camera
works fine in qcam but is not available as webcam in Firefox, not even
after going through Jan Grulich's blog post=C2=B9.

Workaround is proxying the camera via OBS Studio. OBS works with the
camera, and can "export" the video as a virtual camera that is then
available for Firefox.

Thanks for this driver!

Best regards,
Ingvar Hagelund


1)
https://jgrulich.cz/2024/12/13/when-your-webcam-doesnt-work-solving-firefox=
-and-pipewire-issues/

