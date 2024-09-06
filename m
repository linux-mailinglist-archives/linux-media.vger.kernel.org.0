Return-Path: <linux-media+bounces-17827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA896FC7E
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 22:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1811EB21865
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2024 20:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18191D6788;
	Fri,  6 Sep 2024 20:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KBfwCypv";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="dOdrA8+j"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-42.smtp-out.eu-west-1.amazonses.com (a7-42.smtp-out.eu-west-1.amazonses.com [54.240.7.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226982BCF5;
	Fri,  6 Sep 2024 20:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725652939; cv=none; b=oCuvh6opoQr9uQuNKJLlPPDQ58B63fCFu0e8fZICKZ86N+7sMSiWxFm2SrXllLjCWtgr+anIbbRa6bLECmItB97hW9O5tL+kD+W7la2A/w6ijTSfweEHbK50XUWzuw5PYXxZNdbukk6+sK58w+sSmkdMwOlrj/poVOZBKA/6YLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725652939; c=relaxed/simple;
	bh=vj3ywybZ5L9YAyh1lIVp6jPH3WTnH0ExmDAOYOwj8dA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pwpAyvWZRmk0nUksbCv/BAWNXed1LnHOaULGjeWDIvF0NC9OemPetvZ726NZ7u+buhiqg6hImRRNVJz+DlZpUcPZH0NMHOfo+d7pWptHbvL3zQBfxilkQUeR+WgPS15BYFa2Ve8Bn2aBGq4CODQZqwIt3oDSPpDuZXbfOX26Gfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KBfwCypv; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=dOdrA8+j; arc=none smtp.client-ip=54.240.7.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725652935;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=vj3ywybZ5L9YAyh1lIVp6jPH3WTnH0ExmDAOYOwj8dA=;
	b=KBfwCypvcRPdsL/Eo0DFYXrF2uApqQtwT6PvonrhhJDvZLsAxau0euqDaiSDUdxu
	+/Nj4l2RhQ7GKV/tUfO2IjO60l+fvzncB2zyRf69Takz910PdyUltEEoBwdr7wuMPUY
	TxmJ8RKKHAH2z+TSt3OtZK3L/1CK6ruxVr1azoWyL/wQz//PPoDzztOKqKFMRJ21oaH
	qpe0NeQtrynWDqVbLCylgvFwLIOVMnXcQ3ZhdO4ZoUsqf5nn0yzN7zMSk6UvkGeugp5
	qxdYa+U8y5zO7wpQ+U1gxA0TxQAYXB9o27RUjzPqIAn+Q/kiWB7bZ0/CNE51UATeqww
	CCHi7mEaZA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725652935;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=vj3ywybZ5L9YAyh1lIVp6jPH3WTnH0ExmDAOYOwj8dA=;
	b=dOdrA8+jrpjcFCumpeWG9DyalV69rl6yMTX0Ziye+dYBdM81FVIz/vI37I4GiNix
	FsIgyxdjuYRqfpvwiZ9N5tPCLv/jH02ra7BMfTmE0rwidMTDNCapSlvPCFUWKTM3UQS
	TZiA8gddWV92lQNq3O9OlqVvGuVdspVajZAwJI9Y=
Message-ID: <01020191c8ee20f9-9382cd7e-c3f5-4e19-a9d2-9222fd36e789-000000@eu-west-1.amazonses.com>
Subject: Re: [PATCH v4 0/4] Add Synopsys DesignWare HDMI RX Controller
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>, 
	Tim Surber <me@timsurber.de>
Cc: heiko <heiko@sntech.de>, mchehab <mchehab@kernel.org>, 
	robh <robh@kernel.org>, krzk+dt <krzk+dt@kernel.org>, 
	conor+dt <conor+dt@kernel.org>, mturquette <mturquette@baylibre.com>, 
	sboyd <sboyd@kernel.org>, "p.zabel" <p.zabel@pengutronix.de>, 
	"jose.abreu" <jose.abreu@synopsys.com>, 
	"nelson.costa" <nelson.costa@synopsys.com>, 
	"shawn.wen" <shawn.wen@rock-chips.com>, 
	hverkuil <hverkuil@xs4all.nl>, 
	hverkuil-cisco <hverkuil-cisco@xs4all.nl>, 
	kernel <kernel@collabora.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-rockchip <linux-rockchip@lists.infradead.org>
Date: Fri, 6 Sep 2024 20:02:14 +0000
In-Reply-To: <1919d97402f.b403f96c443474.1860819764033812181@collabora.com>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
	 <6f5c4ebb-84ab-4b65-9817-ac5f6158911f@timsurber.de>
	 <19150697f90.11f343d091099757.4301715823219222254@collabora.com>
	 <74850340-b662-4a58-b5eb-a4e352c5002c@timsurber.de>
	 <1919d97402f.b403f96c443474.1860819764033812181@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.42

Hi Shreya,

Le jeudi 29 août 2024 à 15:33 +0530, Shreeya Patel a écrit :
>  ---- On Thu, 29 Aug 2024 03:43:40 +0530  Tim Surber  wrote --- 
>  > Hi Shreeya,
>  > 
>  > another hint:
>  > 
>  > Changing the EDID like you described fixed the 4k60fps BGR3 input.
>  > 
>  > But still for NV16/NV24 (I can't output NV12 for some reason) there is 
>  > the error which Nicolas described.
>  > 
>  > The output from v4l2-ctl for NV16/NV24 is:
>  > 
>  > Plane 0           :
>  >         Bytes per Line : 3840
>  >         Size Image     : 8294400
>  > 
>  > According to Nicolas there should be an additional plane/more memory 
>  > reserved.
>  > 
> 
> Yes, it could be possible that the imagesize is incorrect as we made some
> modifications related to it in v4. I'll increase this as required by the NV12/24
> and see if that fixes the issue.


Sorry for the slow feedback, just noticed this message. Please make sure to us
v4l2-common, these exists exactly because no one can get strides and image size
right on first go.

Nicolas

