Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5F83CB370
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 05:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728443AbfJDDHk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 23:07:40 -0400
Received: from mx1.ucr.edu ([138.23.248.2]:60432 "EHLO mx1.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727758AbfJDDHk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 23:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1570158459; x=1601694459;
  h=mime-version:from:date:message-id:subject:to;
  bh=RN9CKHTen/d8AzQy4/Qgg8mfWD2nuXi8jZZ7rTTEx4w=;
  b=ffqRk9gZB1V4wYumMKSJwiiURT8WEye7WZ+hZnkHB/IKGXQ3oQXENQ14
   zzogpUUFDtmOA41z3Vf4k5+XSHd9JMsFFrS0XDh3S/Bspm+Om31ywJPOQ
   JoC4cP7FT+JzhZGQq12A12hKyOK4KJjDhbwNy5b49XzASbCozZ2oudLqP
   AlVtR4RBjgPf5yztg6GGT/Dm9RlHn8eWNSbyOCp9ylbPiz7W4LG6koNjC
   mFOZe+fql5QYWfwCbL7iqnNQB6wDB587AEtAokLcvG/4ZA3ylNCwA7aAb
   NScgmlwpL6JrrId54WTG651Fhv90pLbHeVJu5tgGgTeuaflAzKcKQEVnB
   g==;
IronPort-SDR: 2qsaIvjocvvFrx+SP09AlNvrr2Mmtwf9yZqeSkQ1BH1wkOjp7vUZbzLNCWiwQuN+ob1cz8vL6J
 6X+cA/2c6QEN75qEJDm+Cgj9/BPBvUHqAkTlUHrk1fwopyp7SZalg4xNGpbZYJQpzO/QXZtGZZ
 DB1dd4brzh7COEb5kBPinhRVDmGUAwEp5hvt8u62JrNurhNsFROcUD5nc1i13NtwJLlJDWhAPr
 I2DdW2Rs+4DoJhgbKB3g46Wk2iBpC+rmq2DEHo4/aV7gqzsWlL7is0cs/f0JrM1x5wWFit8LHS
 YV4=
IronPort-PHdr: =?us-ascii?q?9a23=3Ajhzh4hynw9Q1JbfXCy+O+j09IxM/srCxBDY+r6?=
 =?us-ascii?q?Qd2+4RIJqq85mqBkHD//Il1AaPAdyAra8cw8Pt8InYEVQa5piAtH1QOLdtbD?=
 =?us-ascii?q?Qizfssogo7HcSeAlf6JvO5JwYzHcBFSUM3tyrjaRsdF8nxfUDdrWOv5jAOBB?=
 =?us-ascii?q?r/KRB1JuPoEYLOksi7ze+/94DdbglShDexfa55IQmrownWqsQYm5ZpJLwryh?=
 =?us-ascii?q?vOrHtIeuBWyn1tKFmOgRvy5dq+8YB6/ShItP0v68BPUaPhf6QlVrNYFygpM3?=
 =?us-ascii?q?o05MLwqxbOSxaE62YGXWUXlhpIBBXF7A3/U5zsvCb2qvZx1S+HNsDtU7s6RS?=
 =?us-ascii?q?qt4LtqSB/wiScIKTg58H3MisdtiK5XuQ+tqwBjz4LRZoyeKfhwcb7Hfd4CSm?=
 =?us-ascii?q?VPXshfWS9cDI2ic4QCFPYBMfpCooXhu1cCsRmzCA+xD+3v0D9IgXr20LU43O?=
 =?us-ascii?q?QgEADG3BEgH9UTu3vXrNX6LqYSWv2ywajIzDTDb+lZ2Tbh5ITUfB0suuyMUq?=
 =?us-ascii?q?5qccbL10YgCh7Fg0yWpIf4PD2VzvwAv3aH4+dkT+6iiG4qpxtsrjWuxMogkI?=
 =?us-ascii?q?vEip8Tx1vZ7yt22pw1Kse9SENjZN6kF4ZfuD+COottR8MiX3louCEnyr0aoZ?=
 =?us-ascii?q?K7fDYFyJAgxxPHbvyIaYmI4hb6WOaVLzd0mWtpeLy9ihqv60Sgxer8Vs670F?=
 =?us-ascii?q?ZOsCVJiMXDtncI1xDL68iHTOVy/lu51DqRywze7vtILEM0mKbBNpIsw7w9mo?=
 =?us-ascii?q?ARvEjeBiP2nV/5jK6SdkUq4Oio7OHnb63mp56dN497kAD+PrgylsGxGuk4Lx?=
 =?us-ascii?q?QBX3KB9euiybLj4FX1QK9Wgf0ujqnZrJfaKNwfpq64BQ9Vz4ki5w+6Dzi4zd?=
 =?us-ascii?q?sYnGMIIUlbeBKIkYfpIUvCIPPmAvelhVSjjjNry+rBPr37DZWeZkTExbr8cr?=
 =?us-ascii?q?t7rU5GyREvwM534pNfELYKIPPrHET2sZiQCh4/LhzxxuvrCdxVyIwTQySMD7?=
 =?us-ascii?q?WfPaeUtkWHoqodI+ideYldgTf0LbBx9f7vnGI/gHcWZu+01oFRZXylSLAuCE?=
 =?us-ascii?q?WUZ3X9n586FmEF9l41V+vsh3WJSnhObGz0Uq4hsGIVEoWjWLbCVICwh/Sz3C?=
 =?us-ascii?q?66VslHdGBPCwjUSl/1fJ/CVvsRPnHBavR9myAJAODyA7Qq0guj4Uqjk+Jq?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HfAgAhtpZdhkenVdFlDoVtM4RMjl6?=
 =?us-ascii?q?FFwGYGAEIAQEBDi8BAYcIIzgTAgMJAQEFAQEBAQEFBAEBAhABAQEICwsIKYV?=
 =?us-ascii?q?AgjopAYNVEXwPAiYCJBIBBQEiATSDAIILoWCBAzyLJoEyiGcBCQ2BSBJ6KIw?=
 =?us-ascii?q?OgheDdYg9glgEgTcBAQGVK5ZSAQYCghEUA4xRiEQbgiqXFi2NfplKDyOBRoF?=
 =?us-ascii?q?7MxolfwZngU9PEBSBaY1xWySRewEB?=
X-IPAS-Result: =?us-ascii?q?A2HfAgAhtpZdhkenVdFlDoVtM4RMjl6FFwGYGAEIAQEBD?=
 =?us-ascii?q?i8BAYcIIzgTAgMJAQEFAQEBAQEFBAEBAhABAQEICwsIKYVAgjopAYNVEXwPA?=
 =?us-ascii?q?iYCJBIBBQEiATSDAIILoWCBAzyLJoEyiGcBCQ2BSBJ6KIwOgheDdYg9glgEg?=
 =?us-ascii?q?TcBAQGVK5ZSAQYCghEUA4xRiEQbgiqXFi2NfplKDyOBRoF7MxolfwZngU9PE?=
 =?us-ascii?q?BSBaY1xWySRewEB?=
X-IronPort-AV: E=Sophos;i="5.67,254,1566889200"; 
   d="scan'208";a="12046756"
Received: from mail-lf1-f71.google.com ([209.85.167.71])
  by smtp1.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Oct 2019 20:07:38 -0700
Received: by mail-lf1-f71.google.com with SMTP id o9so525313lfd.7
        for <linux-media@vger.kernel.org>; Thu, 03 Oct 2019 20:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Gprptgb/D4uz1mTeGnBDmcKTep1HuW7kyCYf5C8z4Co=;
        b=Z7fvZO2DjYg0yjsvjJZAz2xvNxZHmmSzn36LHYBEPh+bcn0jh0cJdqRi4NGpbsZkPD
         4Z72gVQZF/v1OQWvaplLy0PxLVLaDKprkwWxkdvrs52dTCNY4wMcfjRQO0sV3a1nvRVk
         y1EHjNpt3xH+CzHmEj+14xg+z0Lsj2BLBE759+0zt6f3R3YaenS04i+8z61mXmt1YL7x
         jM4vI2Yzeza5SsFCVUzazzQjO4Eb+46bRJukSYUXdaabuxVL855j5zd9syOK3jCpQ66k
         GfwH1hWaPDqPt3zq+67c/8MD5o0U74+hHb0BKoj2ZCfe8yVosaBguOqeqpyvA1UCESVp
         tsBw==
X-Gm-Message-State: APjAAAUTIh6TCMsIu6hCB2UCzr0SMqR3f9Re7pvshbpy5+xUK9ejUF0l
        oshDYToW0djuD8kzBIfJ/t5hm5BcUmspqIo5UDOckL3ojdbbJxgG30JJ2OiopWzqzaCYY/PufQ8
        ncDhgyoMXS5CCo+6P8kr9OSW3Jv+DnZeETQ584lRE
X-Received: by 2002:a19:4347:: with SMTP id m7mr7221212lfj.146.1570158456184;
        Thu, 03 Oct 2019 20:07:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy1gzWU7F9biAtlO2s2CoRz63u8XSVBg2NhJ6vIfGvUItq/CcTWhKWWJu+vf9C+aetGDu0r72WLidv5lP/oPY8=
X-Received: by 2002:a19:4347:: with SMTP id m7mr7221200lfj.146.1570158455860;
 Thu, 03 Oct 2019 20:07:35 -0700 (PDT)
MIME-Version: 1.0
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Thu, 3 Oct 2019 20:07:22 -0700
Message-ID: <CABvMjLQGfNgp4tfV3WQ9CFf57-CN6s5eu1V5ymBPsxEBD3si8g@mail.gmail.com>
Subject: The potential uninitialized variables used in function isc_interrupt()
To:     eugen.hristev@microchip.com, linux-media@vger.kernel.org,
        Zhiyun Qian <zhiyunq@cs.ucr.edu>,
        Chengyu Song <csong@cs.ucr.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen:

In function isc_interrupt(), variable "isc_intsr" and "isc_intmask"
(drivers/media/platform/atmel/atmel-isc-base.c)
could be uninitialized if regmap_read() fails and return -EINVAL .
However, they are used to decide the control flow later in the if
 statement, which is potentially unsafe.

We cannot simply return -EINVAL in isc_interrupt() because it is
out of the return type: irqreturn_t.

Thanks for your time to check this case.

-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
