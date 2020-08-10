Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C303724063E
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 14:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgHJM5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 08:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbgHJM5T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 08:57:19 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900C1C061756;
        Mon, 10 Aug 2020 05:57:19 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id x7so4115059qvi.5;
        Mon, 10 Aug 2020 05:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding:content-disposition;
        bh=z0/SpRfjDNng3wVgPxNyjoPNbqlrro1JtfarPU8kMbw=;
        b=MEg6Ckvq7UUSIYMLL9FSaLPM5ma12TFGVZiZhIC1HGFmzIDqvA6zGzfUaSny4LoVWn
         4kwLa4g3yVXVfFh2vTSOdyconH6HnNas+2X9V7plGrfJDukcO03nLsHTN+Nq4ge+/QlD
         PvkEPvkDMnHfw/VZWH68OJz5GOqVWS2BQdXAcxjhKCUUqcBBArTsn/ikg7+flY+kKePg
         6VOCx8vm19wq1yd6N8O0J/m655zdmHWKrwUvXuiN24f2a5gD1ypZ4OYr3LiDDJ8Dp8v8
         +Fqla/3SSABnWANpenXdhBebQ6xKdsFE+dTHGCZroXHXePabhMnRTvI55Zlq1/n0s3pw
         ne1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding
         :content-disposition;
        bh=z0/SpRfjDNng3wVgPxNyjoPNbqlrro1JtfarPU8kMbw=;
        b=eglFi51wrg5BF/oCUOMKcDIIYh8LGHzsIfcwjZwqLfAxKeD7f0l/qNLFIIP7cATSjZ
         r3DMi7KBQWiLD9+m5qBmRzQU3RTQ1RDDmSYGTgHvcVkXvAFnWngF9zknfT7kE0Ipzta+
         eltr1vL7ggpVvz8mWMihIKMpKCqvra2eZONzkJAkdRCQ0vaBT6SOmKtwgE6nmJpR0zTE
         44damzoIzFfC3Df14cDMqqmmB8c4Zf7x2m/Wx2MQ76AYX7uSYtPMftSUaTwGt+4qx03S
         C/etQXchrCpaAaUOHzF/gWnykCXc8SMcbsBVmJZso4a9mojFuvhdCrOCnLQ990xR3SJ5
         CtAA==
X-Gm-Message-State: AOAM533IpOsRVyVUYfw1uWa1OnjHvAbW9/6OAACREa9/+WigcPNhHwDt
        b1eby224x1Nhre4aD7unTtU=
X-Google-Smtp-Source: ABdhPJxiWodk10CgYN0+zlPTnmXouw73+vXBS1cEc3wXKs0NGkqpGwx2Wi9RFAmQ4VnAhp3JuCxAag==
X-Received: by 2002:a05:6214:184b:: with SMTP id d11mr21437937qvy.21.1597064238210;
        Mon, 10 Aug 2020 05:57:18 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id c22sm14349262qke.2.2020.08.10.05.57.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2020 05:57:17 -0700 (PDT)
Date:   Mon, 10 Aug 2020 09:57:11 -0300
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "=?utf-8?Q?skhan=40linuxfoundation.org?=" <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "=?utf-8?Q?linux-media=40vger.kernel.org?=" 
        <linux-media@vger.kernel.org>,
        "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" 
        <linux-kernel@vger.kernel.org>
Message-ID: <AC5CA7E6-F72F-4131-A27B-2A2B505F2F5C@getmailspring.com>
In-Reply-To: <20200808204007.GI6186@pendragon.ideasonboard.com>
References: <20200808204007.GI6186@pendragon.ideasonboard.com>
Subject: Re: [PATCH 03/20] media: usb: uvc_ctrl.c: add temp variable for
 list iteration
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent!

> I'f you're OK with these changes there's no need to resubmit, I can
> update when applying. Please let me know how you'd like to proceed.

That's OK with me!


Thanks for reviewing.

- Daniel
