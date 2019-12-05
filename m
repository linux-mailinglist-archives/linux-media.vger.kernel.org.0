Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDAB21139FD
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 03:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728624AbfLECjJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 21:39:09 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38066 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728548AbfLECjI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 21:39:08 -0500
Received: by mail-pf1-f193.google.com with SMTP id x185so835536pfc.5
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2019 18:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=27jaH0vN7Z1055mM7vLy7qQTaIl7MlRb9ifdmBrbZDM=;
        b=2AEXe14iZdFWfADVPMho1nGLswqsSNlAEnAUgFieMyEajydA5UtIA2BcOw3cvQHdZO
         +7SSE0yQn7fq3n4nHsbvSjKepiS29Gm5WR9rq8NTOvdFdi1YqxhsWZNbYk8a14XIStKF
         hb74QE/F9ENthSZE3yzn0ZQDkHdLNmssNPXh/EW0qy0yWmB7IFhwbQ7Hy2WVvJXW05oI
         H1C0sUhnHCdN0aF6ajXMtxjjgQBm0bYucIo02eLqXp6IojHQsBo24gGBGz9ZhVJZDdLp
         4LhMKEeYfNiw1x190FxFAVW9rFhpjJNh7tIG1Cx/l25+RJ0xiWa5+IVfaItxv51z2fvq
         fu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=27jaH0vN7Z1055mM7vLy7qQTaIl7MlRb9ifdmBrbZDM=;
        b=Q8pMVpYweg8K2Y/ppftsSj7YdaLko9S9+BtoQ4Zve+Uq/HMOWTzFy/9C0Xd6s46O9J
         RGuwNfx1wldLnnjl10eM8N2XJ14Pp1M2cuy3JNnw/q6oQRhZRFlaTanHfmCdHzF63E4W
         8/A2huSRb17mL9cZ0e6l8wMh0rRRzBHsRANxNwcsCMCieRhP6sezQnzW3dYqIWk3p4xX
         Y1yCLRy6NEVNe80P21kubg/LdVzJC+4qHGtxL+Hz9UL83fXLGkGLWBHnNcDzkn2eHF07
         tMqrJXSQ5scP0zsRzc2vQWvW5f13rYY24CKQwnqWnL+LF3pateVW1kzF9rgCCLs+DDSr
         lclA==
X-Gm-Message-State: APjAAAWZfwc31pd0vLPWOWlqp58m4hkCzLKofwAzA3QYzaEPPZqcvQqg
        HtlwQF3Oyeb43S0f658NL0dd4Q==
X-Google-Smtp-Source: APXvYqyArhAsoFW/09BUx58Mqa57A85qEfp9wqhmY84drnrMDAvAJYGziHESSDaQZke2fKs6Z2jx+w==
X-Received: by 2002:a62:6884:: with SMTP id d126mr6446169pfc.109.1575513548166;
        Wed, 04 Dec 2019 18:39:08 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:18db:9496:e12f:2012])
        by smtp.gmail.com with ESMTPSA id k21sm8765676pgt.22.2019.12.04.18.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 18:39:07 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Colin King <colin.king@canonical.com>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: add missing allocation failure check on new_buf
In-Reply-To: <20191204141159.1432387-1-colin.king@canonical.com>
References: <20191204141159.1432387-1-colin.king@canonical.com>
Date:   Wed, 04 Dec 2019 18:39:06 -0800
Message-ID: <m2a7877ayd.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> Currently if the allocation of new_buf fails then a null pointer
> dereference occurs when assiging new_buf->vb. Avoid this by returning
> early on a memory allocation failure as there is not much more can
> be done at this point.
>
> Addresses-Coverity: ("Dereference null return")
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
