Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 166A9CAE88
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 20:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730098AbfJCSui (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 14:50:38 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36799 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfJCSui (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 14:50:38 -0400
Received: by mail-lf1-f65.google.com with SMTP id x80so2648911lff.3;
        Thu, 03 Oct 2019 11:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ZMjTfXw/FnezHAk5tyM0I/7HqxhpFv3+1gaNdAT1gA=;
        b=YxBunfFeoDcVeqn84EwxXsXZ9ef0ZSN0vrIeZ+W7SIbRfvIGZC1DbdV5ANDLCwYEe6
         uhQRiViH2wYfwTYpGrdjMe/mIMVMyedY+NxyYOLlQxaXPCXJTxEI2MQEk3HQKLbD2AM7
         ZJSe2SlW9RmO8pTKvS4yMcz85zAnXD26JDt/GVhm54+vwjhpyCLk5FkAEUykEfOlvVDD
         Voi2RZnGT0VqhmCgmRCF68cqdgp2cLCrXGK036Nc/k+rympQLjeL6IBSwnImNm9VazkS
         psHawdVxUYbJ5Ev3KQwmio/48O5HvlwbY0j2y0fsj/e5Z0OKQhwWMKFIxMMFDNarA350
         Ot3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ZMjTfXw/FnezHAk5tyM0I/7HqxhpFv3+1gaNdAT1gA=;
        b=NB18TV1pdVoTm3CFt8dLbDT5v76GcE+NbMcv/+zubg1K4PAy5BdrIr7SA2fD75hCW2
         MvDduWgoEsTTTKrcsRuhfDSeW5ggC+FgUUu5xhcu4LPs4TW/47tUuROXxVm4GsiDkbQn
         rtC1s+YQasxwlAL/WnFYirJY0R8DrCC8lsQXY1wocvZ96FsB6Q6NthN8svb3rzNEkmtj
         BEb5pD1A+1/eioUhUIaAbY6+PH2RnSvAtPW455ZnR6pvrS2TY9M+RZKY/bKw6yRRcAfl
         RmIZfsGgVC5Y6y8j26fzWBTEFgBavJkuDf/gF3olonDSg8kL4KtVpZh3/b8GlQkmzhfY
         eTUQ==
X-Gm-Message-State: APjAAAWTDYRypfq8MdKLjg5XT6OwzzCLuonrX7S7Svc5LPBLuJqBRGxT
        cbuVAiDvaiMFISZ6zHWdVxYnYGFLfcbjUrunKYkpUbuDeak=
X-Google-Smtp-Source: APXvYqxMvIji3CA3olAI+wy+GZGY9vTPhNSkyjx755cfF7fosTi1u7CyfwbzUay9HsEfUgrLM35J0dfl342GIT2bqC8=
X-Received: by 2002:a19:7b03:: with SMTP id w3mr49797lfc.16.1570128635944;
 Thu, 03 Oct 2019 11:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl> <20191002154922.7f1cfc76@coco.lan>
 <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
 <20191003080539.2b13c03b@coco.lan> <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
 <20191003120238.75811da6@coco.lan> <20191003160336.GA5125@Limone>
 <20191003130909.01d29b77@coco.lan> <20191003162326.GA2727@Limone>
 <20191003144225.0137bf6c@coco.lan> <20191003183200.GA2631@Limone> <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl>
In-Reply-To: <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl>
From:   Gonsolo <gonsolo@gmail.com>
Date:   Thu, 3 Oct 2019 20:50:24 +0200
Message-ID: <CANL0fFS7OEzpgCaHqXdYQYitKzrcfBd0B00K0_KASTDSHV=VBw@mail.gmail.com>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
To:     JP <jp@jpvw.nl>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, crope@iki.fi,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> try other firmware?
> http://palosaari.fi/linux/v4l-dvb/firmware/Si2168/

I already downloaded version 4.0.25 from there.

-rw-r--r-- 1 root    root    6,8K Apr  5  2018
/lib/firmware/dvb-demod-si2168-b40-01.fw.gonzo
-rw-rw-r-- 1 gonsolo gonsolo  16K Okt  3 13:08
/lib/firmware/dvb-demod-si2168-b40-01.fw

No difference.

-- 
g
