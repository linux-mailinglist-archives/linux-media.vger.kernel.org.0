Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC3F9F1DCF
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 19:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727631AbfKFSx2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 13:53:28 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36950 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbfKFSx1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 13:53:27 -0500
Received: by mail-lf1-f66.google.com with SMTP id b20so18865747lfp.4;
        Wed, 06 Nov 2019 10:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLznzpSficyw+cau4sOkgTHjwC6PDJjCQ2rc4dgYYf0=;
        b=Uql4rKOH7YgCusk36G4GBA9j5aQqXDA2dil4Eort1qMg+nyJf4fU4XuWqpb26XppgD
         0JzxBjE6pTIWU0ASmNkl5HdB5M08OcwuV+qobzVEAKXw4M0GTPjSv2yY6uBulF5Nu0t5
         IZxST+zmVFc6ZU2GiaC7+Xu3LGWsp4B0JRbrirVN2De7cusI0tfXmrGX8UYdtJpWenll
         7+VdkPu7piECCLx7Qi2XyPz5oHMjBODP5SyEwD8SlUbOCMlfU58wfE8tp3sKRHrxhPDV
         9mxCQ+K7x0bWjpT9Ak7ZNIe/debUSmAjocY4ffMoF61qUETgyq6Bw6NWIYis01Qa2Nan
         1cIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLznzpSficyw+cau4sOkgTHjwC6PDJjCQ2rc4dgYYf0=;
        b=GJGuzRnkKHjmSv7w0+qDIiEB3dXMN7v+0r0R7P9TOjZYPDNeXX8XqC+mzAvQP30FuJ
         /V2khfC8W59bvqL8xFHYGEBSenV+mTZ/aMf0nkhs97ZOR3H9WHCwp/m6c+L+7idlzeXp
         1ZSL3HppiCFRqkqD76nnY7KLMA7OSsjBiQ0Cn5lviA/pfG/eU/UmsfT/wF+AOv/8+iAZ
         52DyIk1dzdReoqcdDeSP8nsuF+YiA6rBzWpqiNDJWrmeywIdLqEuB3o3vHPVH2lyRcX+
         l4SKJjcVttdFiRDsB8mDCndxPi62aJWU6LES8UmUT5ZSQtC4V4G7ToY6/0rKA7Jw3vhI
         U6Ww==
X-Gm-Message-State: APjAAAWyhhF7CqA3hq5H0skDJr4TMCT6A4Dmgn8gvp85lIQlSp9p9Tfe
        Wh5hx+7TsogJm8emxBuxnwAQj+v9xjN18r2l83o=
X-Google-Smtp-Source: APXvYqwhALcE0Us/iv8boWdM3KnNNSApk/MhZ/BEZTaZYHvpzh8pEJOdNvMu28YyHDCFyNdTPBi/DufunSiut7FMiFo=
X-Received: by 2002:ac2:5097:: with SMTP id f23mr25347199lfm.90.1573066403944;
 Wed, 06 Nov 2019 10:53:23 -0800 (PST)
MIME-Version: 1.0
References: <20191106183716.29170-1-dwlsalmeida@gmail.com>
In-Reply-To: <20191106183716.29170-1-dwlsalmeida@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 6 Nov 2019 15:53:14 -0300
Message-ID: <CAOMZO5Dm6d5wO+uFdAzcOHt-S_LWpH1dHH=Q-+wGaCiknU=zoQ@mail.gmail.com>
Subject: Re: [PATCH] media: dvb_dummy_fe: place EXPORT_SYMBOL below
 corresponding function
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, rfontana@redhat.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        allison@lohutok.net, Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Wed, Nov 6, 2019 at 3:51 PM Daniel W. S. Almeida
<dwlsalmeida@gmail.com> wrote:
>
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Please write a commit log.

> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
