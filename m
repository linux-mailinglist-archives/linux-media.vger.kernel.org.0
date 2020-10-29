Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6FA429F338
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 18:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgJ2R3w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 13:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgJ2R3w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 13:29:52 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB40C0613D5;
        Thu, 29 Oct 2020 10:29:51 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id k21so1688149wmi.1;
        Thu, 29 Oct 2020 10:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tsIIeip0c9OlJdC8NFlOSS5E1Z7oDwE4UBzxXI1dq7s=;
        b=GbM6ENuT0F23wMLW0DhxPoEL5YTO4sypFhgCg/Cya8YiHIqmjhEvz9a4gyqPbNG4oi
         9WNEcxOzrjcxV8esnGytuW8318rfFhDdd/8Tc8hpsPepdJ1FH/x8CQfMHQFQDJdPqKMX
         +hgfeNncnMqxW6CamPNF3/2yW9YoEKbF8rEw/kzyIPQOCNa3Mp9kdePAqHTFLHsoueAa
         MSq+0DLegSEY3DT1mBOoDew7YFd8NlO3sbToMv3hu92SovAX4MniCJZkVIlWb/DqsnCO
         CIrjteUgpmRxKphROrGURmyfzoPI09qWT7Ve8tcpGJoSpupgDW2UyvyNshfJ1zhho36C
         Ms2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tsIIeip0c9OlJdC8NFlOSS5E1Z7oDwE4UBzxXI1dq7s=;
        b=Tml08oooq6VBELs5oOR5r25dfd5NRI/atnPjYd4A7wHtVTMGJsdodjcsFDdtTJpZoy
         7fGEI93raZUlmkklahI4SjIoPfIgnGYudlB2juh9IZXt3abGqtQ6RJH6g/qcl3mO4xDK
         vWI6Fn+vUTsvsyqoSyetJIrAaQh8I+n3Ju0AIynHqP/CtVIbeSkqjmeSU/0d7kgP8C0v
         t0Ugjpk9KtzTfvCpnsapBkDNaqTL58pBTmme1zGqongpYMZNKJ9lAra5tufUbhST8L+A
         njsJM0Hg0eQwhxNDFbr+NKK+SZ+V38/QjZC7zdjyAMv0xK6uPT88n8tZRfbHiJTqDhJV
         fyBw==
X-Gm-Message-State: AOAM5331H5ZTDXS4MT1ogaz+izI8J7ZcnDujQAyzpeD8Ug2IaT0H6bJt
        NZaIgGKFBeq0BFhWkmn4S4YdNIR6HtP7vE8I
X-Google-Smtp-Source: ABdhPJzBKlcpXFAQxlmhKefQ9tQW3qGj5R/Jh5QlUeUBoCbKG1Yj4j7c02bQAjc54td9cBzFIPtWWQ==
X-Received: by 2002:a1c:ddc4:: with SMTP id u187mr961117wmg.156.1603992590441;
        Thu, 29 Oct 2020 10:29:50 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id e11sm5866054wrj.75.2020.10.29.10.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 10:29:49 -0700 (PDT)
From:   kholk11@gmail.com
To:     mchehab@kernel.org
Cc:     robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 0/2] Add support for the Sony Exmor-RS IMX300 camera sensor
Date:   Thu, 29 Oct 2020 18:29:45 +0100
Message-Id: <20201029172947.34315-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series adds support for the IMX300 camera sensor, (one of the)
first Exmor-RS Stacked CMOS sensor(s), with support for both of the
supported aspect ratios (4:3 and 16:9).
This driver came out from reverse engineering of so called "userspace
drivers" from Sony Xperia smartphones.

I tried to document all of my findings and giving a sense to the registers
as much as possible, but that was only partially possible and resembles
some names from the IMX219 public datasheet, even though the addresses are
basically completely different.

This camera sensor driver was tested with all the resolutions declared in
it on two phones: Sony Xperia XA2 and XA2 Ultra, on a SDM630 SoC (camss
patches for this SoC will come in a later series) and is working great.

- Changes in v2:
  - Changed dt-binding name and fixed a misconception about lane
    operation (sensor supports 2/4-Lane, driver supports 4-Lane only)
  - Now using lowercase names for regulator supplies
  - Fixed redefinition of clock-noncontinuous property
  - Added informations about constraints on data bus frequencies
  - Fixed MAINTAINERS: removed git tree

AngeloGioacchino Del Regno (2):
  media: i2c: Add driver for the Sony Exmor-RS IMX300 camera sensor
  media: dt-bindings: media: i2c: Add IMX300 CMOS sensor binding

 .../bindings/media/i2c/sony,imx300.yaml       |  112 +
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/Kconfig                     |   13 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx300.c                    | 3089 +++++++++++++++++
 5 files changed, 3222 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
 create mode 100644 drivers/media/i2c/imx300.c

-- 
2.28.0

