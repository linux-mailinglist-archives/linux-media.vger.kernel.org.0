Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4AF1611D8
	for <lists+linux-media@lfdr.de>; Mon, 17 Feb 2020 13:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbgBQMQQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Feb 2020 07:16:16 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:52837 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728114AbgBQMQQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Feb 2020 07:16:16 -0500
Received: by mail-wm1-f43.google.com with SMTP id p9so16927096wmc.2
        for <linux-media@vger.kernel.org>; Mon, 17 Feb 2020 04:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:user-agent:mime-version
         :content-transfer-encoding;
        bh=qqZikFSGaeQoRKjs6/oFE5+Tlv4ApeKi0YKRr7muwNc=;
        b=sS3jU1bHV7tOy930zZypvzwwaUPTWRNtcmX7igHSRq2SFvecnayPJX1krq0uOcNO6K
         v6bb2OEZhbhoOp+54A1ZxWKlo7QNnN8bHVZhy1PbZhMzgo67R2iHkLn8AhwmuiHXqrV7
         sV95K7BdEZEWXPW5hUWYH6Wx755BrZfTrR8UfiMDJRjn4IOOGK+Pt7lJhf10vY3VskzC
         mjK7f/o0I4TpAtdMntSbJxy0ElK/ff0hdIWhGojG2t8pvNFf1t32w/aHlFMGt10yNjuW
         sF/h2Khey/chm6MEGliYWgKYNWe317PGYuknocpmji9Kzq26sHHiLYGfS6gyWVdYtAge
         QbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:user-agent
         :mime-version:content-transfer-encoding;
        bh=qqZikFSGaeQoRKjs6/oFE5+Tlv4ApeKi0YKRr7muwNc=;
        b=JHClJ9eUcsWJ2AuaiFmhy8d8P3WTfS8u7XxqiIZTAOrCYJCxFybPdjWa3ftr5tgxB3
         61Dweh6m+rA0duhjwjJvIPqe3Fl7P9y1p8kAwAqF+eZZOsMpVL6KBczlMSV5Q8SwfnEA
         M4PyOGK+5xDJG89F0vJf/rXe4q6f1R5mehnxDFGhE2DszWP/eLFEyh/91KHko9bZ4RHJ
         YBouSMqptw/PM75YqeqhMnqe6/0Gw8tfQyd/bmwaDnTYx8aTeLHqSSmHXWSKeUaqG+bV
         ULfHeifeyfsbc8LRrfr3bj64KFdHyLmlB7TRPhSf/XFM7V+MLfmB9XfvFIeVBUg2UCRA
         alxg==
X-Gm-Message-State: APjAAAXJa1NrAwtyqFMpCwDjgDJOJ7f4zS7TRzIey4dr8PehkvgvCudj
        VYLCyt7Dv97RmPGlk8j3Dj+HNq/u8Bs=
X-Google-Smtp-Source: APXvYqx04S2rCu5bbjvFRzVzubKKsMCeFN9620SKTVT/gUhhtaJsFMUYQzLXL6152TgGJrAlWbn22w==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr22076015wmk.172.1581941773520;
        Mon, 17 Feb 2020 04:16:13 -0800 (PST)
Received: from ULTRAMARINE.kynesim.co.uk (238.196-30-62.static.virginmediabusiness.co.uk. [62.30.196.238])
        by smtp.gmail.com with ESMTPSA id h2sm729494wrt.45.2020.02.17.04.16.12
        for <linux-media@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 17 Feb 2020 04:16:13 -0800 (PST)
From:   John Cox <jc@kynesim.co.uk>
To:     linux-media@vger.kernel.org
Subject: Multiple activve jobs with the V4L2 request i/f?
Date:   Mon, 17 Feb 2020 12:16:12 +0000
Message-ID: <2p0l4fhbn1mvfcm8h5kubi44kujkmgm0sg@4ax.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

I have built a H265 V4L2 request decoder and I based it on the staged
sunxi cedrus decoder.  As it stands it appears to me that in the request
environment one request comes in which is processed and then is acked
with v4l2_m2m_buf_done_and_job_finish which returns the output & capture
(if not held) buffers and then the next request can start.  Our decode
process has two passes and so is most efficient if two frames are being
processed at the same time.  Is it possible in the stateless request
world to separate the return of the output & capture buffers and/or to
allow multiple requests to be active at the same time?  If so is there
any example code I can look at?

Many thanks

John Cox
