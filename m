Return-Path: <linux-media+bounces-24856-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F35A1445E
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 23:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BC1D3A97DB
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2025 22:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0271E1DD88F;
	Thu, 16 Jan 2025 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="XyGw1O2f"
X-Original-To: linux-media@vger.kernel.org
Received: from mr85p00im-ztdg06011901.me.com (mr85p00im-ztdg06011901.me.com [17.58.23.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E456158520
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737065315; cv=none; b=MrdGoO2+x8P/7FNASKRH9szeQU8hfJVryws4hDjPdXMRPULZ7GGL5RYM6l603sTH3kCnREOlHMIC6zjxcnoSmm4bfJ0EmauYaeB7nuzqSEA81jpWmBSzjHtAEGe/YKIg6cMAljhfQtjSBjK59ef5qm94/5UV+FaVi0erfxdKs5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737065315; c=relaxed/simple;
	bh=1WlJHjJf6hRh1KiIkcBsRUOkTm0Maayzkkrf8aGlOck=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type; b=GlUAIHwZOK4rkdpDq8ywvjjyvZ/H1vjqJFzvQjnoNcTKRhG0U2NirDHa1EF63m3KqzZfV3hC8SyOc77MbNsLL8oU65SZcb8zmNCxca1edS7jyzkmOXrjnc1sEPgsHWGmRk5eTe0latJuKwLD24HLsV0VZ5KUhkfm6r6Qy29XmxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=XyGw1O2f; arc=none smtp.client-ip=17.58.23.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1737065313;
	bh=1WlJHjJf6hRh1KiIkcBsRUOkTm0Maayzkkrf8aGlOck=;
	h=Message-ID:Date:MIME-Version:To:From:Content-Type:x-icloud-hme;
	b=XyGw1O2fvx3NW5GBTTsAYzV5YKI4zSphnCL2qagc+DgzLehcCrSvAcc1xUAUXKkTY
	 oHCDr0XSmgwK3SP18WpiiuYmwv4YI1UnfT0/DbtUwcQZdAq1P6yEpAvI1R5c+6tP2y
	 fajUOnUsculOq3EhJK3MBv4EDMlzFWpJNSiyV2r5ezycWgajKo0r9fzhabBB0x/5oD
	 /nLIAFY2w++LQoBUOl2QeYOV/vHbxtfvv7uVV5ajWyeS6L8flNoJlWrZh5lN7SkO6o
	 6xv+yj/5mA7jXa22X0En1T2VFlnuS53ybE3qwzkphGl9gVe57Ve3ntDw/azpAhVhIH
	 qQGfBfsUWIRlA==
Received: from [10.1.1.110] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011901.me.com (Postfix) with ESMTPSA id E8A431349EA8
	for <linux-media@vger.kernel.org>; Thu, 16 Jan 2025 22:08:32 +0000 (UTC)
Message-ID: <a5d4099a-e689-42e6-ac5c-5827a42abc18@icloud.com>
Date: Fri, 17 Jan 2025 09:08:31 +1100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
From: David Arnold <david.c.arnold@icloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oYniR5bZIrNl6ssr0C2s3NwNCjPE-lb9
X-Proofpoint-ORIG-GUID: oYniR5bZIrNl6ssr0C2s3NwNCjPE-lb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=350
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2501160163

who


