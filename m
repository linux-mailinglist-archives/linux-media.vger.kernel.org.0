Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9859B35D6F5
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 07:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243206AbhDMFPm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 01:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbhDMFPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 01:15:37 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB5B3C061574;
        Mon, 12 Apr 2021 22:15:18 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id e2so3261590plh.8;
        Mon, 12 Apr 2021 22:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=TrWrFryNSzPKJP5fTzUG9PfiRUJAobg9pZY4O3rR+fc=;
        b=acpu65aV+rMpf10pSGE9y4X0HC+bdtGZqcJ+hEUAk1WgUA5Bp5JSmQa9u6CvjNEZAF
         9o6g4dsncgcMCcbRJ/m/rVSnk8AMOqLy5G0KxeuQuLYyI5BS5BI9je24yggsn3V1Tx2g
         0kzW/8aZm4Y748iWMNGsNNu9H4oL4D96PiVDu7G6ZkQ5vUdgfFXfPgB/fJydOX8a3A/C
         KGiCgf2ZHnFP34u2bWNrMWtudBkqIezsYaUam2fveKquWx9YweNRPIFTI9913fuvyr4O
         7qkfkASoW48dYOu6oQbx5euWT552QYXo7mLkB53h8ElUrA+SiFZFfiYknXIpqc7+RGrz
         f/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TrWrFryNSzPKJP5fTzUG9PfiRUJAobg9pZY4O3rR+fc=;
        b=kQr6KJhmA4iYzetBI4pHqyW67BV+/K3GRpL+E6KB6837zz/AIdW2iQOsbJ0JHSQ50L
         WpL2XYWek2XZFvknRUWpeLmbGKj/jVra5QJNvOt8lFfUobYBWUmeGTaTeVY2G2t6uVZf
         dZFWDSxq91ttkF0Ta/c89HnkxXqP43u/EQkWO+Tj9ykNFVRpFdwPy/j3m5xEIXuyFHCm
         axmHVydqotpLup04lYzGZa/L7hhVd/Vje5Noyi3avtvh1vMmQXWt0QSvHwsBJP31Y9o2
         XmrUmxZvOKI4tSFBIH0RDyo4g+n9XF2oU59clsDKiI98pXBcSgDXJeIsbDJ5xY1ud4M4
         VRpw==
X-Gm-Message-State: AOAM531g8alIY8/kRMDd2MM4n7MRwzLcKknTLOZ+Ovdz0hd7hfpNn9cE
        QRID3FUhDN6CatusTvJ69GY=
X-Google-Smtp-Source: ABdhPJwO6ofb2zQAdrctcX8eqcNteWdixruCgaAs+5HjYGg89JzO0O4ffm9XHG3jpWWEGhDHo7eHUg==
X-Received: by 2002:a17:902:d64a:b029:e6:30a6:64e3 with SMTP id y10-20020a170902d64ab02900e630a664e3mr30785825plh.28.1618290918006;
        Mon, 12 Apr 2021 22:15:18 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id l35sm13144853pgm.10.2021.04.12.22.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 22:15:17 -0700 (PDT)
Date:   Tue, 13 Apr 2021 10:45:11 +0530
From:   Mitali Borkar <mitaliborkar810@gmail.com>
To:     sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Subject: [PATCH v2 0/4] staging: media: intel-ipu3: Cleanup patchset for
 style issues
Message-ID: <cover.1618289130.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes from v1:-
Dropped patches 1/6 and 2/6 and compiled this as a patchset of 4
patches.
[PATCH 1/4]:- No changes.
[PATCH 2/4]:- No changes.
[PATCH 3/4]:- Reduced length of a line under 80 characters. This was
patch 5/6 previously.
[PATCH 4/4]:- No changes.

Mitali Borkar (4):
  staging: media: intel-ipu3: remove unnecessary blank line
  staging: media: intel-ipu3: reduce length of line
  staging: media: intel-ipu3: reduce length of line
  staging: media: intel-ipu3: remove space before tabs

 .../staging/media/ipu3/include/intel-ipu3.h    | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.30.2

