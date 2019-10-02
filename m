Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B884C8AA7
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 16:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbfJBOOM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 10:14:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42140 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727632AbfJBOOM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 10:14:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id n14so19834443wrw.9;
        Wed, 02 Oct 2019 07:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X+k0rmIpLeQyFw0vbDJkaiBHIsea4EqTqF7yRc5LC68=;
        b=kuJHU1eBC9EH5NS4R3KNt1jizAkrXvS8rIKPDsFDr7NiMTpLFxbD7sOfBdif8jA897
         KzcegkqgCNJDfLed+7DNqOoCVH9EEJG6hqv5zf+T5CeV45FZvOCpjC7RzVk8HwT4AoiY
         bJkD4ImtYDcUkctVTHtIJzP6lBXErpNd6/iBrGEOidfUlH+1j25FSRkmRpIsHecPAJBz
         a4rLcKek+Zuxy4lAbXALA28FiTn5PkEB/qTJ3fxhJAWUzACpVg0kfCSQ43E8FT6FIt1w
         NAvtrJNgLFUpz0Du4HuRCsTLofCOEcuuXlA4PCRF+6ih9vNy0g+2IkgSv+Z0DKyXHpEu
         KTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X+k0rmIpLeQyFw0vbDJkaiBHIsea4EqTqF7yRc5LC68=;
        b=jUQL0FYJNOryROga9ASrEID4ZxrA094f+R83aK1GhrKBa+j7PfUN3S3I50LsMbErwz
         zt/cY5WHplxlwbYkaXnTMuDVkqkUf0tF/YJyUyH/sSAmwA+ur/lhYJB618sFmcO0CFBk
         mgjqcxA3Zjp31zrA0CCEvNms5eVCkApI6D0J3Ca300A30zQzrLurR0vNBFwqLSYjBMA4
         yNx/zY7bnf3voNu2wKz84NWn1Vyp6VqoooiArd/ldipj7JuQ5yyxo3a+DyVJTMGPVMXR
         qwhfVzLl1qYnlHWFFHZrOd3uy4n0d0JuKgs+qCVTVnpX9dj7f2yMDf4vunpObcuiW+pD
         7tQA==
X-Gm-Message-State: APjAAAWT2soHELplgOSTA+UOyeY84VIeOwfVVF6eAnOfiZIDSO5NEkRS
        5V3I5BVRbVQB/3GgKu1GNAOOLsD8Mk0=
X-Google-Smtp-Source: APXvYqzGD3LZdWkLWw0XHJ+8vdGo4lU6akKYPh/9G4s89S7f7Yu8kvL6OF6LOwbAqkwWV57TdO7loA==
X-Received: by 2002:adf:dc03:: with SMTP id t3mr3246679wri.27.1570025648273;
        Wed, 02 Oct 2019 07:14:08 -0700 (PDT)
Received: from Limone.filmuniversitaet.de ([195.37.64.251])
        by smtp.googlemail.com with ESMTPSA id d193sm8781121wmd.0.2019.10.02.07.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:14:07 -0700 (PDT)
From:   Gon Solo <gonsolo@gmail.com>
To:     mchehab+samsung@kernel.org
Cc:     sean@mess.org, crope@iki.fi, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, Gon Solo <gonsolo@gmail.com>
Subject: [PATCH] si2157: Add support for Logilink VG0022A.
Date:   Wed,  2 Oct 2019 16:13:58 +0200
Message-Id: <20191002141359.30166-1-gonsolo@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001205203.4b1a5fb6@coco.lan>
References: <20191001205203.4b1a5fb6@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Mauro!

Thanks for your reply, I tried to address most of your concerns,
so please bear with me (especially this is my first email with
git send-email). :)

> First of all, don't attach a patch. Instead, just send it with a decent
> emailer (with won't mangle whitespaces) or use git send-email...

Done.

> You shouldn't just blindly comment out some code, as this will very likely
> break support for all other devices supported by the driver...

Done. I extracted power_up into its own function, chip querying is now
done in probe. I don't have enough knowledge about hardware to do the
right thing on my own. If there is anybody willing to guide me I will
spend some time on it.

The original patch where the problem is discussed is
https://lkml.kernel.org/lkml/1489616530-4025-1-git-send-email-andreas@kemnade.info

> ... yet, looking on what you've done, it seems that you're actually
> adding support for a different tuner at the si2157 driver.
> If this is the case, this should be on a separate patch, and in a way
> that it will become clear that it won't break support for any existing
> device.

I'm not entirely sure how to split this up. Can you give some advice?

> Why did you do such change? dev_dbg can already print the function, and
> much more. See:

Thanks for the link. I removed these lines.

> The above seems specific for your device. You need to check if the device
> is USB_VID_DEXATEK, running the code only on such case.

Done. Though I'm not sure whether I did it the right way.

Thanks for all the advice, I hope this will be included eventually.
g

