Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B71FE37651E
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236583AbhEGMbA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233468AbhEGMbA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:31:00 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBCAC061574;
        Fri,  7 May 2021 05:29:59 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id b11-20020a7bc24b0000b0290148da0694ffso7074538wmj.2;
        Fri, 07 May 2021 05:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1t5cr263LZN2aTz3Al7pSQM5qBRuIroNjq3vIPHmzy4=;
        b=Lo6uQ7JDFIVlslQKRS3aOJnfHCNdHfs+0WiECvpQ/qLb1QPV8hmm2HH6Y71Rjk2mZt
         mXLABihur0oidXcXwI2LIKID5vvOjNtA80d/k05UHXIV/wjHHhfUQlu/dp4R8JfGrGwS
         OWUR//5Dyfep2vZF2V5t407O+G3yzVV+mq8vD7/s08++8qNsqSidYuJ0JBMddbnmbQ77
         xgrm2UYaT+cYp64E7HWr3vfxDPdlLW8ap0oPpqVQnc/zLjs1XzD0Trw8jj1M/kR72xQQ
         +p6YK08NS+fraT0bEvFmCJaW/+3XYSnveeYGcpvPEPwvg9aYO/ld2z7mL1x4FcfdRb2t
         lIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1t5cr263LZN2aTz3Al7pSQM5qBRuIroNjq3vIPHmzy4=;
        b=bQRGVQNWQ+fVCO/jxEtdKrn13wZjwIEt1/e1HxEouTc9xoscRYINyy8ypXOe2k9PJ5
         NgnMnGXdCkYdeVnOS88qFh5J+UsPTpQJo/k2UdL8M/otqfbvWW5CVo+zyBNYz5pE4b4c
         E4SC0p1B7PahxfaFu5GhW4X6oGnwg6qWeus7fKtA/iSkSWqjd3fYNRZfvYyP+DFplnDa
         JLZC9hjGNiNcZUvNulHewrVUx4n38h8dyBeHSaLjv2V7DNF0IhQVEddrGrM5d9Ahoayf
         jhLgVyukpKgzJ2uk0+2Vt7soiR01unVEk/uZMYwEhC04gb9csr/1rXKMHc4kpETpflId
         fAWQ==
X-Gm-Message-State: AOAM531n7HkiTBthmmkEV7GyJER/i8B9uVU4SbsyMd0E+GOmrY8hFxBM
        oylB1yM+zDZPlrqQn+oFiao=
X-Google-Smtp-Source: ABdhPJwzla/fwihJbSMelTOqfKPOh4LnvMl0F1s0oOIMkXc8xz2ROg6oJ+XtfzbiXO7XF3kjk2WacA==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr9558018wmc.95.1620390598465;
        Fri, 07 May 2021 05:29:58 -0700 (PDT)
Received: from localhost.localdomain ([94.103.226.84])
        by smtp.gmail.com with ESMTPSA id u2sm8813393wmm.5.2021.05.07.05.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 05:29:58 -0700 (PDT)
Date:   Fri, 7 May 2021 15:29:54 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Uladzislau Rezki <urezki@gmail.com>, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in __vmalloc_node_range
Message-ID: <20210507152954.5773592a@gmail.com>
In-Reply-To: <20210507080435.GF1922@kadam>
References: <000000000000fdc0be05c1a6d68f@google.com>
        <20210506142210.GA37570@pc638.lan>
        <20210506145722.GC1955@kadam>
        <20210506180053.4770f495@gmail.com>
        <20210507080435.GF1922@kadam>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 7 May 2021 11:04:36 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Thu, May 06, 2021 at 06:00:53PM +0300, Pavel Skripkin wrote:
> > 
> > Hi!
> > 
> > I've already sent the patch:
> > https://patchwork.linuxtv.org/project/linux-media/patch/20210506121211.8556-1-paskripkin@gmail.com/ 
> > 
> 
> Please, always add a Fixes tag.
> 
> Fixes: 4d43e13f723e ("V4L/DVB (4643): Multi-input patch for DVB-USB
> device")
> 
> regards,
> dan carpenter
> 

oh..., that's one thing I always forget about. Thanks for pointing it
out, I'll send v2 soon 


With regards,
Pavel Skripkin
