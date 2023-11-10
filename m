Return-Path: <linux-media+bounces-7-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4B17E7EB6
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F35C428150E
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAF33A267;
	Fri, 10 Nov 2023 17:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FDbLf3FG"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC538DD4
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:32 +0000 (UTC)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CA228B0D
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 02:23:38 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-77896da2118so121652685a.1
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 02:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699611817; x=1700216617; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5QkwWxIGEOurCFKWXSk9BruqjsYwly8P0Gesk2pyj0w=;
        b=FDbLf3FGnVdR5E/WsV1HMu8xWevptE7QKJlGsykZ09rn3SvTaxJxv1ffFcU5F/guAs
         uAi5Ixgkj6pHoIQs6XoI/XqFm0MwEQfa8HtgFu1Dl/xq+XYln3+uyd7FkUUu9cgqCNvZ
         PktFJcgDzFg7Ac+ICAaNYHKt7wJbIM5UzwHvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699611817; x=1700216617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QkwWxIGEOurCFKWXSk9BruqjsYwly8P0Gesk2pyj0w=;
        b=F8crktQHeMrAhB/gCiDV88fRoZP7Q4s8ehvX7G31RKzF3mf3vnYzgJ9Qlboy6/ooIB
         iNf34GcqquOAygLE6i54fC/7EwAYNGDda/vxgcRwfmNic1bjunkooibA+Z7+IIfjplIP
         QqKuFuAJ1pir7fLSXlvrVvOZM5v+iXzdmMABrG/yoHa3auor8jpOip/bmsAYYxxNjY9t
         BwEsgw0fvGUJKLbm1UTBU+MvbifjxKvo2ZsSMkZmbVgke6VF1iWFRk5xzZrcFVxuvMAE
         8eh98Fo7GCXSErDPq/r6kQ65bHdhCFbrgzJaO8ZluW7jG50EgWZv0q+BUUMOab75TdP9
         ZmJA==
X-Gm-Message-State: AOJu0YxbNgj8x9FnIkL5o05KAXwsAi02gOnfH395qLptmt9+Wtaz5ojb
	8Kct9Z6H2hF3aAUZB5FJS/yo0JPxbNKKYaG3STFLwQ==
X-Google-Smtp-Source: AGHT+IGQ9U8RWouyGc/Gq9CBEN00/JgF8M7tx+rKxdF9hnBEl/NPClBKjJqf5nwZ8XI9E7NwwJcrqg==
X-Received: by 2002:a05:620a:3945:b0:775:446b:85fa with SMTP id qs5-20020a05620a394500b00775446b85famr2255135qkn.3.1699611816963;
        Fri, 10 Nov 2023 02:23:36 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id pb6-20020a05620a838600b0076f12fcb0easm605092qkn.2.2023.11.10.02.23.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 02:23:36 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6779fe2b7c6so4055046d6.0
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 02:23:36 -0800 (PST)
X-Received: by 2002:a05:6214:2a4b:b0:66d:1f29:3ea8 with SMTP id
 jf11-20020a0562142a4b00b0066d1f293ea8mr8383989qvb.57.1699611815808; Fri, 10
 Nov 2023 02:23:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220920-resend-hwtimestamp-v7-0-cf1d78bb8821@chromium.org>
 <CANiDSCtC2zOKtopkuuqJYqi6+FQ1Kav6LfMH5gGhKrnDeG7GYw@mail.gmail.com> <CANiDSCteBUraA0UrLM-cU_GqDSWcWERJNV_xhsi3LNQZNvX5dA@mail.gmail.com>
In-Reply-To: <CANiDSCteBUraA0UrLM-cU_GqDSWcWERJNV_xhsi3LNQZNvX5dA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 10 Nov 2023 11:23:24 +0100
X-Gmail-Original-Message-ID: <CANiDSCu9Ca_rxhu=KJb6q2=UPcUjXu8VchLNHTjquCj5qf7rTw@mail.gmail.com>
Message-ID: <CANiDSCu9Ca_rxhu=KJb6q2=UPcUjXu8VchLNHTjquCj5qf7rTw@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] uvcvideo: Fixes for hw timestamping
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, "hn.chen" <hn.chen@sunplusit.com>
Content-Type: text/plain; charset="UTF-8"

Hi

Another friendly bi-monthly ping on this ...

Regards!

On Mon, 4 Sept 2023 at 13:55, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Again
>
> This has been waiting from March, and it has been already been
>
> Reviewed-by: Sergey
> and
> Tested-by: Sunplus
>
> Is there something that I can do to help merging this patchset?
>
> Thanks!
>
> On Tue, 15 Aug 2023 at 13:26, Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Hi Laurent
> >
> > Could you give a look to this patchset?
> >
> > Thanks!
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

