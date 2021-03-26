Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A038734A436
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 10:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhCZJVm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 05:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhCZJV0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 05:21:26 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587D1C0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:21:26 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b14so6650872lfv.8
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=SXlGw5E8cFMEBSYNsj3Vz3BMobAzf0JuRIAQr46wPC0=;
        b=c1tFJvdvp/PtYGc1kAB6xyJv/JzjcI31/XrFxcQM6NMX75DdUof5OlUTsXlUH17T5a
         YXBo91exx7cI824xn/9ZUfLSEOJJ1BEybM6OgFfDuM6kjmMTVHLTshYPsiOnEp+3Uu9y
         kkuQIBe8jNnuv9wyELVxDkG2Z01xU90GlZPfJWOCfl8X12IIClD5DjXIoMHMUMebK+9g
         79MzY2hiI5HgjuJ6Ct5BHGp/x1N1/xjchaqLaNVd8sCxG347EQebg/kJ+qr15O2eAzQH
         A/yXGu+yES7NUJ8QLHbDYzwncCYgHcxz85HsUN/Ar9QWOLG2Gc5qn3ZpsL3O8hBtXDFF
         9QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=SXlGw5E8cFMEBSYNsj3Vz3BMobAzf0JuRIAQr46wPC0=;
        b=H/jZYHrvmGDnjMe3nA0FXQqEKBDcHss60EWxLuDdYpvZ2UHL8sQPKs4TUuIffIeGqz
         KjKD1J58a01Ze2KpiFsSY0F+jXaHEJ1JRvXJSEQgJE5XrVAPaIpaC9cfL/I3IfBVx/bB
         bE2Phc2/EPbKuxz6NgyiS7um3IJN25kBPqam0NtGUKJeCJIkQVX8xNqVKHbj+mX1T1N+
         59AtQfJQKWLa1XKSITSX+MXHwx7z6XYP25hpQn188mUT7YbAFcQ1QKm0ZKN5mPCn+Ea3
         yw7DEVh+TrmB7G5BDsi24n+iC3WHwbkDtnXHshAa9X0QJQqnGAaPCr+O0bLjaflRgytO
         gtPA==
X-Gm-Message-State: AOAM532KNvNL74n/3+XraQFgouljo3436fO317s/cSPctJ/cQBMxTd8t
        rU2uB+L/F40EPS0RQA/s16eXOwrRz6MH7w==
X-Google-Smtp-Source: ABdhPJz/dN3ASQCBbsu+lvIlURutLQANLw1UJxfHq9mBq/yRFyCeGJezG9ilg25vvY+xPE7CJCWzvw==
X-Received: by 2002:ac2:5444:: with SMTP id d4mr7820522lfn.126.1616750484919;
        Fri, 26 Mar 2021 02:21:24 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id k30sm1052702ljc.140.2021.03.26.02.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:21:24 -0700 (PDT)
Date:   Fri, 26 Mar 2021 10:21:23 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: v4l-utils: nullptr dereference after 56175f62bef28490 ("qv4l2: fix
 CaptureWin::setWindowSize() if there are multiple screens")
Message-ID: <YF2nk3JzgYD/37oU@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

I just rebuilt latest v4l-utils master and unfortunately found a problem 
with qv4l2. I run it on my target devices with X forwarding and after 
commit 56175f62bef28490 ("qv4l2: fix CaptureWin::setWindowSize() if 
there are multiple screens") I get a segmentation fault when I try to 
start a capture. When the windows that displays the capture is suppose 
to pop-up it crashes as it tries to dereference a nullptr.

I bisected the problem to the mentioned commit and the change

	-       QScreen *screen = QGuiApplication::screenAt(mapToGlobal({width() / 2, 0}));
	+       QScreen *screen = window()->windowHandle()->screen();

After the change window()->windowHandle() returns a nullptr for me and 
then I die.

-- 
Regards,
Niklas Söderlund
