Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A591230A68
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 14:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729815AbgG1MkZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 08:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729628AbgG1MkZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 08:40:25 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED48C061794;
        Tue, 28 Jul 2020 05:40:25 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t15so11577113pjq.5;
        Tue, 28 Jul 2020 05:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
        b=n1A4woKQkiSxjFUkK2MMPTGX0gyTFj/XulU59DI2cWd/Mcq6RKEgRLaDmie8NCO8h9
         jsPDDRUT3oeNmmNF5siGZwU1IpeJONcINRtQDUF38G+on+DtCrImdXPVJFlJvptSDDkv
         VEwLMz+8Oqf1P5bu8tDQCeY8n2iViYnIA7QZiG0BRfhpSRfanxyAV27/dWBIOsYGXIqd
         G/1NZZ6oa7GHULisQkUENnU+3q86anKc3DyZPvHhUHBBF6AW5qZlOTFL1bVG31JKoifM
         nIgLMXv4ai5zVtC6A24Fk8veg5TwvycMHiO0xixiU+1apvHMT2J5BNNPNHu/TAZ6xng1
         ODgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
        b=XX/PH27dOvtOFw4PYvXJAvev263VA189SmGVhfs+aHf1FY8It48VUUT1L1K6/6G+Kf
         dGMu597cc4y02CfFXaADRWIngiGjATSNBvYcdFs23l78gB3EZ/b3vwmxDp9RLyEhyE8P
         vhsd5uxxSMJK00VIloFfPb4dep6OILYEIP8FS+SwSXVg6Pv92N+YskQBJ9MSy3T8l/Y9
         k30YLuRvPPwmOk3v603yCOeYLp7mI1qy04m38WMrH9B9CA5cgWI+l9DzviWTbZxjJSro
         o2RGvYSaKzt+GGM5/eOsoUWDRCY7B4aFxAMw1zjyX3Xf8h/lif4Jvs6TOI2ZC0bnx8d0
         /cYQ==
X-Gm-Message-State: AOAM5312CqODrI7aqwOwmxaevIT+OSvaM/sp/AHJ3oDHL4ryrGUHfVLL
        +ZMgzFKkaqOS2yVyJAACCCU=
X-Google-Smtp-Source: ABdhPJw8aqJ7SAGLcxLIBXeRhtSyQt1UsMeiXdJoz3QIIdThiUkmDWaY2TmIa0NCvzERhDJ3DPwTRQ==
X-Received: by 2002:a17:902:8204:: with SMTP id x4mr24110574pln.16.1595940024900;
        Tue, 28 Jul 2020 05:40:24 -0700 (PDT)
Received: from gmail.com ([2401:4900:2eef:ca92:3545:4a68:f406:d612])
        by smtp.gmail.com with ESMTPSA id r2sm18220374pfh.106.2020.07.28.05.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 05:40:24 -0700 (PDT)
Date:   Tue, 28 Jul 2020 18:08:55 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v1] [media] bttv: use generic power management
Message-ID: <20200728123855.GD1331847@gmail.com>
References: <20200728102418.1069512-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200728102418.1069512-1-vaibhavgupta40@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is compile-tested only.

Thanks
Vaibhav Gupta
