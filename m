Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2E63EADD6
	for <lists+linux-media@lfdr.de>; Fri, 13 Aug 2021 02:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236471AbhHMAVv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Aug 2021 20:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236607AbhHMAVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Aug 2021 20:21:41 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC354C0617A8
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 17:21:15 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id r72so10955336iod.6
        for <linux-media@vger.kernel.org>; Thu, 12 Aug 2021 17:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=XW7E6eMIUzBOMeFJlgcA+60MtDtkCTUh5FeR0EffHK0=;
        b=FxvXKnL9Ow50P/sCD64YR+mmtOXvKbqubYIhoplwch+zlosb2HRgt2cuZ0qwE+yLlN
         LvwEyFLgA0hiUjL05ktTgmbKb/Ql2iogV/lOZfS8ubNGBCOAH+SLu2oYLVK2VaOg5z5j
         q9pkb+6evIY0WbmWef9YpmNBwbP05UivCb4el79zmyTYJxnlGhtnCQi8NE2yqO8fztX7
         B6kvXwqptinXu8HS0Gb5DHfU604iCFpHZ1Cch3r8Fsk8nja/bUTsqxRwslxjQMhQHl7N
         AqX6z3lsnI1aE9nHPkMRB25wEkLFMkhxdRi0o2L3hjt2JWF/fn2Mo8AHY3gKu5q965en
         PsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=XW7E6eMIUzBOMeFJlgcA+60MtDtkCTUh5FeR0EffHK0=;
        b=D9NYDV6jtYHjScCLLSJ83fYPN15Bg/DCNTxXqqyW7faifvNswdNOxqDC92yWXb0SF1
         hx5K4ZK188yjBTeUlT+2bPGQ92WUbjcpvlZLUqc5Rv15c0i5rQkpS0GgOddMV8RAV08Q
         imugFu4M9l4ftaKZ+7hb65QGxhXZCKG/Tt8xgVbJ/IuVIdbrBMHxexdQ1ew+zvpano5K
         tIRCZj66p5N5Y8Wlac3+PRVrJ7XSRZfYPVxNxo5Vs9HOcsSIQnaZhQwcjqUa5DlCZlvx
         0XepZOQ/6nw1Nyhepk7H8jpvPDVBtjhSbIkEp6vL+ld3TX5W251iC5FoHTEjkpBNzJ1L
         /btA==
X-Gm-Message-State: AOAM5309C//IyJc99W/kYMbbj5B9eMPhk74wybMg8Vm45Lpow0h1097i
        sskg96lPAe/g4j3+cAD420nN1pPT+do1LPie2S5PVWPY4tIQCQ==
X-Google-Smtp-Source: ABdhPJyjiNixsEmaxzGLfwy3sbyj2wysTt1NbuzzLya2qKWw2gG0wyMhrM+pbH6tr46K8YDZxmAYfdB0JOU18UqXuz4=
X-Received: by 2002:a05:6638:419a:: with SMTP id az26mr5996345jab.70.1628814075057;
 Thu, 12 Aug 2021 17:21:15 -0700 (PDT)
MIME-Version: 1.0
From:   Andrew Goff <goffa72@gmail.com>
Date:   Fri, 13 Aug 2021 10:21:04 +1000
Message-ID: <CAAUSrfF4Wks0TTe=G+uSoksagSo_+S67JAsWJS1PGzvkS3DPmQ@mail.gmail.com>
Subject: Sony PlayTV Dual Tuner- dvb_usb_dib0700
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, I hope this is the right place for posting this.

I have the above TV tuner / capture device which has been working well
in Ubuntu 16.04. I've decided to update the OS to Ubuntu 20.04 with a
fresh install on a different disk and haven't been able to get this
device working.

Ubuntu 21.04, 18.04 have also been tested with the same results. On a
fresh install of 16.04 this device works well.

It seems something has changed between 16.04 (kernel 4.15.0-142) and
18.04 (kernel 5.4.0-42).

In /etc/modprobe.d/dvb.conf
# Sony Play TV
options dvb-usb-dib0700 adapter_nr=5,6 force_lna_activation=1

This has been tested with different variations of the above without success.

When using w_scan with a file manager open I've noticed if scanning
adapter6 I could see the folder named adapter5 disappear. I then
opened up the adapter6 folder and two of the four files had
disappeared. When the scan finished the files/folder reappeared,
however the device then became unusable.

'modinfo dvb_usb_dib0700 | grep depends' yields the following

For Ubuntu 18.04
depends:
dib7000m,dib9000,dibx000_common,dvb-usb,dib0090,dib0070,dib3000mc,rc-core

For Ubuntu 16.04
depends:        dib7000m,dvb-usb,dib0090,dib0070,dib3000mc,rc-core

So something has changed in the driver?

Please let me know if any further information is required to help fix this.
Thanks
Andrew
