Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79AA35E746
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 21:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348089AbhDMTu3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 15:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348070AbhDMTu2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 15:50:28 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61895C061574;
        Tue, 13 Apr 2021 12:50:06 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id nm3-20020a17090b19c3b029014e1bbf6c60so5372938pjb.4;
        Tue, 13 Apr 2021 12:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=d5JQs8Tx+1jZkGxhLa1z0jf/2TQov6WAQJIdCWJLtFk=;
        b=QO5ZH0XWGCAtSnFQasOblaMQqYmA7DsyCoftBXbx1i3qQ263FErvWqdiQuSnH2EOKP
         PEe6WigtGLK5Az5GBaaABOIj3PBGmfUoePMX/7fhc4A1B9nEJHRCXe0EpX1X3TMf2zYy
         dw1idnzkClh6WfP874wu34eSBc/wNP10brzFHT46QNjjG8iiTV2s4e2kyt+bPj8HqxWA
         RBmxmwQ1yCa232XdNRcsdjjJfCf4Ce45obhz0nu2AboimowAiPseA3sQwS2h7L0OEtg5
         ydM7A4DZgH6mhkA/72zbW8trxYbj22pxI6GFkWMDiub5jnp0PGMK/63HtvO/NfCuVTqC
         vWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=d5JQs8Tx+1jZkGxhLa1z0jf/2TQov6WAQJIdCWJLtFk=;
        b=jEmI62TxOm5Ha+0JTVuMJp2PMP3pn6HtqA729Yeuu7VBrYPAwCOs8MSxXobjh2Yin8
         1XSEr7V6qCkfBwmqSxykQwKwNrtUhvgBnYj0VrjeCJtT4k5kSVnAXt+ivr0FWA5PE07j
         sA5Drk2Pq43azzJGN0ucipzwyec50W6E/dz7SWGZiotvVaycJ6lrUbaDT1G4pxJ2Gf+g
         n2a8qLHzpq3HAnnDtf4z+L6lRJ/m+FyXRGIjWSLug54h7PJ5VEIJiASkwqiKdlWbS2dL
         wpOYnQd1w4gK10USTkgdnlz8iM6mOYqlRRux7BLcQZ/NcfR3Zr1TLo+dnSkP8SyUrmvp
         UdDw==
X-Gm-Message-State: AOAM532VkGEoKLCkCwKAKQk2d4pyvwWCHZTNJx9C+YUZ8qeoFIhUJVdB
        +IucZb9+MiqQr+F1Jwq8kIg=
X-Google-Smtp-Source: ABdhPJxuSnZlMUujv5nFXikHkfCpYArxNbEnXKfglBq+r/hSMy4kBhKWI/uRxNZ6Ezk5qMrnYYQyyg==
X-Received: by 2002:a17:90a:7f8b:: with SMTP id m11mr1631827pjl.221.1618343405874;
        Tue, 13 Apr 2021 12:50:05 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id c1sm13350924pfi.142.2021.04.13.12.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 12:50:05 -0700 (PDT)
Date:   Wed, 14 Apr 2021 01:20:00 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     clabbe@baylibre.com, mchehab@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v4 0/2] staging: media: zoran: Cleanup patchset for style
 issues in zr36057.h 
Message-ID: <cover.1618342050.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes from v3:- Rebased these patches and made changes against
mainline code.

Changes from v2:-
[PATCH 1/2]:- No changes.
[PATCH 2/2]:- Aligned the code using tabs.

Changes from v1:- 
[PATCH 1/2]:- No changes.
[PATCH 2/2]:- Aligned the code using tabs and readjusted the
comments line.

Mitali Borkar (2):
  staging: media: zoran: add spaces around '<<' operator
  staging: media: zoran: add BIT() macro and align code

 drivers/staging/media/zoran/zr36057.h | 312 ++++++++++++++------------
 1 file changed, 172 insertions(+), 140 deletions(-)

-- 
2.30.2

