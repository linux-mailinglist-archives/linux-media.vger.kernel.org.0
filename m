Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB3812FAA1
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2020 17:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgACQfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 11:35:34 -0500
Received: from mail-lj1-f177.google.com ([209.85.208.177]:41824 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgACQfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jan 2020 11:35:34 -0500
Received: by mail-lj1-f177.google.com with SMTP id h23so44436932ljc.8;
        Fri, 03 Jan 2020 08:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fFX7uGIZ1X+s79thV3DjoWZzF0PRIpeDDbwCxzY7LwM=;
        b=tB4oPF5Pt840/umBcBu0ZUXFfgP4G8j0ioHyS7wrRSnmcUiciLUY+hwLYnd3Y/AYw6
         M93VdIaHjO2P/xu/dth1dR4zBw7iKOA+kvTyTjpQUa+JQjUxooFKl83thFOCnOZdyMAT
         +vuotpWTyBEpkjRQcSHLisM1LgPBP4lke8u9qfmAfaE9439mpZgLLT89gWtSk/GOe+Lw
         JDmCuREF5SthddWRGbxXuaVaLHHHyR/nyf78JN+wNrGdcyQtlJouTSttEd7IeE+HskkI
         92JVEyzAsfwJETQio4zNn7BCpDOJIMuPNltApGvSfmAzYPz71sJuoVITmgEU3bHOSNTv
         l0gw==
X-Gm-Message-State: APjAAAW4D0j7fKNTEM9M6gOKc0reZTOsdcj6AJ5AY8+ylzAoziPiDGSO
        S9JY5iFPjFSrRtYa53FSYTQ=
X-Google-Smtp-Source: APXvYqwdsfT9Ue4rfa7wkDSMJ6nFrh+aKIp0gZyMBI5hCHZMJfPLm13CY0cMs1nbZoC3osiPdRFX/Q==
X-Received: by 2002:a2e:9b9a:: with SMTP id z26mr52058439lji.181.1578069331694;
        Fri, 03 Jan 2020 08:35:31 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id w6sm24854434lfq.95.2020.01.03.08.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 08:35:30 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1inPvA-0000Kg-Vr; Fri, 03 Jan 2020 17:35:33 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/6] media: fix USB descriptor issues
Date:   Fri,  3 Jan 2020 17:35:07 +0100
Message-Id: <20200103163513.1229-1-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series fixes a number of issues due to missing or incomplete sanity
checks that could lead to NULL-pointer dereferences, memory corruption
or driver misbehaviour when a device has unexpected descriptors.

Johan


Johan Hovold (6):
  media: flexcop-usb: fix endpoint sanity check
  media: ov519: add missing endpoint sanity checks
  media: stv06xx: add missing descriptor sanity checks
  media: xirlink_cit: add missing descriptor sanity checks
  media: dib0700: fix rc endpoint lookup
  media: iguanair: fix endpoint sanity check

 drivers/media/rc/iguanair.c                   |  2 +-
 drivers/media/usb/b2c2/flexcop-usb.c          |  6 +++---
 drivers/media/usb/dvb-usb/dib0700_core.c      |  4 ++--
 drivers/media/usb/gspca/ov519.c               | 10 ++++++++++
 drivers/media/usb/gspca/stv06xx/stv06xx.c     | 19 ++++++++++++++++++-
 .../media/usb/gspca/stv06xx/stv06xx_pb0100.c  |  4 ++++
 drivers/media/usb/gspca/xirlink_cit.c         | 18 +++++++++++++++++-
 7 files changed, 55 insertions(+), 8 deletions(-)

-- 
2.24.1

