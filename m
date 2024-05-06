Return-Path: <linux-media+bounces-10861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A61B8BCD03
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 13:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B87562833B2
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 11:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6B7143883;
	Mon,  6 May 2024 11:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HHL/aBf7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C34D144317
	for <linux-media@vger.kernel.org>; Mon,  6 May 2024 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714995639; cv=none; b=YDsDnqCksPeNmUcXzdPUkldtBrSYYH3SgGsu2b6SZW0tn/CStUv5yf3Ary2V13v9UQpTgvfQldd8jXpaxYqajnWuCPjdMS7er4Kzw/sW3rmUJPgEHLwdgTfyljdEiYQo5xSbra4sDVprtLiiKl6q12O1eO+wxQtiGbAOTCQyB98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714995639; c=relaxed/simple;
	bh=7zoplLiS++xk273t6rSGnzo9VZLOzRmbo7Vl7Ki8K7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkylHQwNhsY0thO0on5x6FAdrz76xBAhwyc+d7kqZowBAlWPymDDi9RxhvN8eY7i7w/wEZHi4Zf4Jb/3uCezEA8IhhT8AonpLGBha5GAmMXPQWZkkvuOPWHbyNVuQ0haYfAJ9uCrbm9W2Q3N7x/PIwYV5WVlKqd+Bl3mN0T2DPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HHL/aBf7; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7928c5be3deso161570985a.0
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714995637; x=1715600437; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wh4vkBLLxYFzXoHShbtMs2G5QtmnN5qPEuo2IpVPXDc=;
        b=HHL/aBf7O1PanfHL4+W71FWbCN1BcvdkfwMgCixyMBE0EP5ucr0ywkbzzzl9ot7tXo
         bfI7P2CgNEhkiazM/nxJJYMKJfRurA0QFyrkaA5+Tsx5yjElH51elbt2ysmiOUAC7pjZ
         Miwyvfo0WTUGBLPFGmljLW/GTGjO0fhi57+mY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714995637; x=1715600437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wh4vkBLLxYFzXoHShbtMs2G5QtmnN5qPEuo2IpVPXDc=;
        b=ThF3BW7JFOQ5wzrm33bS9JxOdMGogGZLLr/wN/bMZeH7Z7dBGO43O4Uz2eAZG2atLM
         kFjp0oYDqqtvQHq5ojHnwbT5b9sL7e/6+EoWeWmigrHG5Go2ZBhipTqTXcXqdNMWLaG9
         9xlN8ERwui1tdZtqesXiY0bguNnior9SsdzY2CpyrpyxpNi899tHWNDFIZbPUZvKtIyA
         n2Cyc75x+hGL8NAMWCMWD5YPe8JWKK2ZdkWks9jmHJokPLrqDsJlDZV6peWwpog10nHn
         XJwsFN7GCCcSRKNsYS2MP+6lBfSVxhBmZs6B4x0nCuvKgQ+iVXnljMtUzfxBHRiDt1Zd
         nnpA==
X-Gm-Message-State: AOJu0YxPoBJVrtO6R5jWizn/Ti7yAADd3VPQTVw81P8MPMhb37qcAGYZ
	qJSHdpuxgOQ4UKhiIKjYFVWb27uV1/+qMos0e7IhqokdCw48++OY1RYcBOhri/P0d398DsT0UGA
	=
X-Google-Smtp-Source: AGHT+IFVCyCyNMh8MnhoOBDVAtvWN+xZxJXFfs9ZCtifAAodSiVlkTwQ5djWjD8/0c7nl8wKB+R0CQ==
X-Received: by 2002:a05:620a:2441:b0:790:f42f:cdbe with SMTP id h1-20020a05620a244100b00790f42fcdbemr13150952qkn.9.1714995637020;
        Mon, 06 May 2024 04:40:37 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id u15-20020a05620a022f00b0079295719bacsm1171604qkm.43.2024.05.06.04.40.35
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 04:40:36 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7928c5be3deso161569085a.0
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 04:40:35 -0700 (PDT)
X-Received: by 2002:ad4:5f8e:0:b0:6a0:ceaf:c6cd with SMTP id
 jp14-20020ad45f8e000000b006a0ceafc6cdmr11775991qvb.33.1714995635356; Mon, 06
 May 2024 04:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
In-Reply-To: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 6 May 2024 13:40:22 +0200
X-Gmail-Original-Message-ID: <CANiDSCuKf_osmsaua6B8O=14F35Z+H=foEHDY8YCxu3PWzX1PQ@mail.gmail.com>
Message-ID: <CANiDSCuKf_osmsaua6B8O=14F35Z+H=foEHDY8YCxu3PWzX1PQ@mail.gmail.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

Thanks for organizing this

On Mon, 6 May 2024 at 13:33, Hans Verkuil <hverkuil@xs4all.nl> wrote:

>
> If you have a topic that you want to discuss, just 'Reply All' to this announcement.
> It would be very much appreciated if you can also add a guesstimate of the time
> you need for your topic.


I would like to talk about media-ci and the multi-committer model.

I am planning to attend in person and I think we will need around 1
hour for this topic

Best regards!



-- 
Ricardo Ribalda

