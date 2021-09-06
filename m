Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F12401C80
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 15:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242666AbhIFNlj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 09:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242575AbhIFNli (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 09:41:38 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B168DC061575
        for <linux-media@vger.kernel.org>; Mon,  6 Sep 2021 06:40:33 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u15-20020a05600c19cf00b002f6445b8f55so4855752wmq.0
        for <linux-media@vger.kernel.org>; Mon, 06 Sep 2021 06:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=h8fzMrlNfeqQ1V7Mw80vYgzWg31AUNU+8kCIzeOvUGI=;
        b=je2IdFXBFDkVDGrZ/5L/zJzOOgyE3lZrrMAc5jKis+ikQ4QzVyyH8H4n6ukkmh/xyk
         pzBXlWwfxhhK3/LZHDkYYY+Ucdx611532nvBAD5hyazba83gwOma33BsStXJTr1RtskT
         nS1EWS9FHclna4c1zy6fUHixoJHpZZde3J+wypLKKw8wDd/6sWMXB6Ei7vFiLfu6Ccht
         Fv3FgSmZ3hfi40JMHNWSKEIyqyefR+rZ+YAIv9Xgj9xsXZfTlEshG0sDKn+wewU/cNe6
         vOkkVYqsEpUJB58rZ6GGDFzQEBzbAnBn+PPe1+KKA6TZvyUix0r8Wl95MxZYcoHTzbhn
         1a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=h8fzMrlNfeqQ1V7Mw80vYgzWg31AUNU+8kCIzeOvUGI=;
        b=fSHy2Y6s5sIzM+/SyDxaq11VlA132ku+uCppzDDU04PJjhCsdxPuMhBm9rzMg2FUy4
         0eXK/KSaQU5AIPBJX1smoTEOLr84BHCL6Gln2Lx8YAcCqD+CDuNbv14Ec5HEmqqbI7j5
         LIHzD6ZwMskmVNg8ifpazT1DjFeLlNEM6b23LK2iIiHjQx3XCSYWbQQqe3ukTJ+DwgzS
         ynLe2wC3fmIsRR4kjSc8eNMd9mS2p+zyIVg7wnI1By+SoKYChoBvktiRT6+d9sIOFQBn
         vr1YGVO84RDUQXt1N1PRRaJdvZAtGIEXooiZA6qTnzHYPQt+lVGM4VjwUuaZbE0Mr1fc
         VA+w==
X-Gm-Message-State: AOAM532bgV/c0YzCz3g1M0jlnQACZcuHMur6J+R4/LnLDpuUZNMz8ivq
        Wfe7Jlo8EdfPBENBwMAbCTJ98A==
X-Google-Smtp-Source: ABdhPJxSZNMrd0jxUL99QDIGbL3HxtYqrJ/yXjYhWzUID0G4CuSLLXg2Je/UOA0ZVhX9lg36hyCAuw==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr11457428wmc.138.1630935632338;
        Mon, 06 Sep 2021 06:40:32 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id d7sm7934372wrs.39.2021.09.06.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 06:40:32 -0700 (PDT)
Date:   Mon, 6 Sep 2021 15:40:30 +0200
From:   LABBE Corentin <clabbe@baylibre.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 6/8] staging: media: zoran: fusion all modules
Message-ID: <YTYaTk9+fCrwHbTG@Red>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
 <20210903191540.3052775-7-clabbe@baylibre.com>
 <9318ec41-d884-2c1a-1190-3a93c3f5a3fb@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9318ec41-d884-2c1a-1190-3a93c3f5a3fb@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le Mon, Sep 06, 2021 at 12:41:32PM +0200, Hans Verkuil a écrit :
> On 03/09/2021 21:15, Corentin Labbe wrote:
> > The zoran driver is split in many modules, but this lead to some
> > problems.
> > One of them is that load order is incorrect when everything is built-in.
> > 
> > Having more than one module is useless, so fusion all zoran modules in
> > one.
> 
> After applying this patch I am no longer able to rmmod the module: it will
> always report that it is in use. This is with a Miro DC30.
> 
> So something is wrong with refcounting.
> 
> I do like the idea of merging all these modules, but it needs a bit more
> testing.
> 
> Regards,
> 
> 	Hans
> 

Hello

I am sorry, I was sure to have successfully removed the zoran module a couple of time with my DC10.
Anyway I just acquired a DC30, so I will test it also (even if I believe that model should not change anything).

Regards
