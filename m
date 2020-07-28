Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C326230A61
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 14:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgG1Mjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 08:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728751AbgG1Mjk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 08:39:40 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D176AC061794;
        Tue, 28 Jul 2020 05:39:40 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id k71so11526849pje.0;
        Tue, 28 Jul 2020 05:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
        b=ZWFrXSF2M1/Ti68YVAyL5qat6asJcr2dbzM4Tvn2CA+WYRnO/6E7QnaX5uwWeDMjIV
         DwkHCuKOxWj4MFRCKmR0y5BeGZ3cN6es32gUrgKqG+solcw/pQZaUUmun1w5G5hjMWfK
         rP7Y3nCCVvj9MYLmTXCoqG7H49/aaLDn03FaVgEhybIBJqV/OdlYHL/xXc4UqDHGDgJ6
         YtKmEYsCGkHq6Mb8TlNgEDnWyCuK6xtEdtKmtrYQLK+0rS85ExySzP8QzZGBX8QuUz7V
         2UriFwuu3JjVCPWje1fIpNIDpwnd690NMMpBZpjhlYIiwaHRSVc+iNo+xngS4NxFF/Ky
         dWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fie8IAXWZ8a1f4IBdyXwUsTRAo2+ebUYgUxfo3SFpeA=;
        b=fUGAUqhoyl6PT8ZEB3qbJUoZVe+rTO1XJzysOZEMTxVm3q24zHpeSFijsBSMjkh9lK
         hQeV0Drys23f/KW1tt3kRLiFB55Sq2ldbhwSh92NY8GBNBU+JDcEt2qB1vIddp2TS6Qy
         tnXqTh+mqUimrWUV8xvjpYvOljxKWAmQ9TESTkcOZGX1VVKRO913BBr/KqCqSO9eeL4h
         mgPIC5YvPGKY0563fEm5iMz5wPwN5zkMepZB6ITLVJZYNjC7nci6jjvIuKxfptV3d4q7
         Ld9UXgy196mTD7ijmz0NbezwvaJ3xLJVCECKUszyEARqjlg2tJAmch0IJJgYfDRslVwE
         +osg==
X-Gm-Message-State: AOAM533X8zYNBdJDC7S2BicUI02ruCxBGRTm4f3NheX20rm23A44NZxR
        XkujDjBnCZRAB1KAQFwmnOI=
X-Google-Smtp-Source: ABdhPJz97qasknYQoT+fY7yWXUWMcSSg+xxuQQMwXn/CTLKMheIuNy7RyQvTXCQd8r41XxEASfXvUg==
X-Received: by 2002:a17:90a:eb17:: with SMTP id j23mr4116840pjz.151.1595939980318;
        Tue, 28 Jul 2020 05:39:40 -0700 (PDT)
Received: from gmail.com ([2401:4900:2eef:ca92:3545:4a68:f406:d612])
        by smtp.gmail.com with ESMTPSA id j13sm2234164pfa.149.2020.07.28.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 05:39:39 -0700 (PDT)
Date:   Tue, 28 Jul 2020 18:08:10 +0530
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <bjorn@helgaas.com>,
        Vaibhav Gupta <vaibhav.varodek@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v1] [media] netup_unidvb: use generic power management
Message-ID: <20200728123810.GC1331847@gmail.com>
References: <20200728092717.937023-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200728092717.937023-1-vaibhavgupta40@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch is compile-tested only.

Thanks
Vaibhav Gupta
