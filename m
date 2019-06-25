Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B89C550FA
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 15:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfFYN7n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 09:59:43 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:39342 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfFYN7n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 09:59:43 -0400
Received: by mail-io1-f41.google.com with SMTP id r185so3219777iod.6
        for <linux-media@vger.kernel.org>; Tue, 25 Jun 2019 06:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FSKVD6KDrsHOIAGdSS2iIF1paS8HEckPICs4ZTQha7A=;
        b=ecAb+aHbHVfPXb4iypgv8GeAIglpM84hLdzUkIAqyhk+2wCosCq++FUV3WnVdwdZHP
         Qch8cQ7/Igi0Rip6A1zWPj4+XhCHHmqy9CgrRC0iVgejvjnxDudL08zdh0CYSBuuJva/
         FCwN1NKMec7zGB//MtWibOZd3NLnbKhZya0Q5J3iKBfBJjhiCnqo9VnCfJHzFoqF4HCv
         rv8b1pumw5qbRiTiOPeI7+uHYWJZQVylfH0ywNFf0GBf3D3pQ1sw2itesbLUig6TqspN
         gDlnibWpEsF6KhMcRz029tjCFI9rsnVAnPr5ZmC2IduFoQI1R9XYUp7A+YFAi6QjyvLc
         DsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FSKVD6KDrsHOIAGdSS2iIF1paS8HEckPICs4ZTQha7A=;
        b=BvvHMLL2PfbtnYEXv5QtVMvojxfn20G/UWNtXM3w5Lp+BZBOhQUK5Cs20AGA9/eS97
         WY75ITBYqE6t3DWiXFAk3MT8AfJVVXC+FCyoZtxUK0jQqlTN+wP9jElRXoZvXJW05rs7
         bQFTsIfZgZKZLBzMcX1nh3h8hbUIr43j5Df+xjkw1tloYGY2jgdDZHfoJOorSbXGAXm8
         3i8pyEK62/QhDc0CXvBzPlnvIuwRT87HmWQH9OEkmE9x1geOS8EhKcgDTJSxgCVaS3iF
         SkPLH9zUY+T3Z8VnhmKoX/+IpuQyH7lK1q/7Hf3Ye7kH6bR1V/5Xk4WmtDBDiqyXJWev
         PcdA==
X-Gm-Message-State: APjAAAX7A+CMkeUMvHQWUHotW/z5GeU6hpfFeVwTS9JvAPLGPm10mFFt
        +YlS56rZwLW9La8LmAR2Pk31KrWYWLcP2aeT94CXjw==
X-Google-Smtp-Source: APXvYqxmnt8MEd1RguBGDPqLRfzzb9romTQZPdCDEivRbQSFmE/+w6gs05eJ6i7Cam4Ehk7qMOhLxD8u0q7TEYPp0B4=
X-Received: by 2002:a02:7420:: with SMTP id o32mr49882917jac.117.1561471181881;
 Tue, 25 Jun 2019 06:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl> <20190624160330.38048-5-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190624160330.38048-5-hverkuil-cisco@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Tue, 25 Jun 2019 15:59:31 +0200
Message-ID: <CALFZZQHLz6jV95NRMrbOdpu1oNh=KCrNpC+t2YiL-8MAUi0dTQ@mail.gmail.com>
Subject: Re: [PATCHv8 04/13] cec: expose the new connector info API
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi.

This looks good except one comment about the ioctl.

On Mon, Jun 24, 2019 at 6:03 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
...
> +static long cec_adap_g_connector_info(struct cec_adapter *adap,
> +                                     struct cec_log_addrs __user *parg)
> +{
> +       if (!(adap->capabilities & CEC_CAP_CONNECTOR_INFO))
> +               return -ENOTTY;
I guess access to adap->conn_info needs to be guarded by the lock now.

> +       if (copy_to_user(parg, &adap->conn_info,
> +                        sizeof(adap->conn_info)))
> +               return -EFAULT;
> +       return 0;
> +}

Best regards.
