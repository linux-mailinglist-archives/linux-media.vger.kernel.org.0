Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56090229349
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 10:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728577AbgGVIUo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 04:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgGVIUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 04:20:44 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69274C0619DC
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 01:20:44 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id d4so804319pgk.4
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2020 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wuKYOtRQFiGfQhvkYI9RR7o5XxwlIwRJUBRsCtkcN94=;
        b=NgD8rI4yNeDTrdnf6fQOH4ABOTqnoVRX+LAsbv2jA7QLlmOd2fM951xmyfU4Vsz/l6
         BeNJoZAmW8+FHVH7ZMBzDyKXEcrNZPBhjw+HjAl90fFENzkIDRXZqMH7m0XaZM3k+do4
         +2iwAIYA7BUMSwj6d0MgQyAGRyaOG+K5ocWho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wuKYOtRQFiGfQhvkYI9RR7o5XxwlIwRJUBRsCtkcN94=;
        b=owAJ/A7ROSWk0qQ91UWxg8zY0dN3z9APCET4udw1S3wIUNmYp4sIGlvbc+2oreW6WY
         rj+Qz4CT04XEIBT40dLzloukvybyTkUj/zuvtJSv7N2wlCJiBcRiFO02ZdKYsHoBfATN
         MJVBzJHtajsKmjNy562cxaPvF9f0qWDESigra54hmcmQQU10Vky7Yi+l+8ImpV1v7G8U
         mqJ2aOmU9DrrB0LR/Ga8aIDjdFCokK/fzdbUqO/XwNaZLvVHL/sepZuVj4HsTIrRnce6
         dSZ2T4+U6MlkCls/5P2KdnVu9gCNy+kMMLeTBmlTkvZOrBifKKCxcGLA4hr/WNSf6U9O
         YDnQ==
X-Gm-Message-State: AOAM531oUJa3cXSbVVCQKtSGsJoo2z81Zo/4fG8sagrCw7rncnVGqdTm
        sMMDZoObXh0w2lcTxX/DLU2zvA==
X-Google-Smtp-Source: ABdhPJxksWCFb2a/rOqZL5GMLMhCz5bm9GQXC/knvsXW1UPFTIPIM5CuzSKU15QpJYvJTum6TG697w==
X-Received: by 2002:a63:6486:: with SMTP id y128mr24622182pgb.82.1595406043910;
        Wed, 22 Jul 2020 01:20:43 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
        by smtp.gmail.com with ESMTPSA id m19sm20559598pgd.13.2020.07.22.01.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 01:20:43 -0700 (PDT)
Date:   Wed, 22 Jul 2020 17:20:41 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        senozhatsky@chromium.org, bingbu.cao@linux.intel.com,
        qingwu.zhang@intel.com
Subject: Re: [PATCH] media: i2c: ov2740: get OTP data ready before nvmem
 registration
Message-ID: <20200722082041.GA42181@google.com>
References: <1595326295-25213-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595326295-25213-1-git-send-email-bingbu.cao@intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/07/21 18:11), Bingbu Cao wrote:
> The OTP data was not ready after registered as nvmem device, it is
> risky as the nvmem read may happen once the device exists, this patch
> get the OTP data ready before registering the nvmem device. OTP data
> missing should not break the normal camera sensor probe, so use a
> warning instead of an error message.
>
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
> Suggested-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Looks good to me,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

	-ss
