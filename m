Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1919639C7F9
	for <lists+linux-media@lfdr.de>; Sat,  5 Jun 2021 13:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhFEL5Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 5 Jun 2021 07:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbhFEL5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 5 Jun 2021 07:57:25 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A57C061766
        for <linux-media@vger.kernel.org>; Sat,  5 Jun 2021 04:55:23 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id e22so9943209pgv.10
        for <linux-media@vger.kernel.org>; Sat, 05 Jun 2021 04:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KvOJfbt5FQZ7baGSdDJj7atyCETnrR2NiUmNORlt4ZY=;
        b=kEtEdRngCaeERXA0cXqdVw5cwI9HmIIiAvxVEGBdM4RqomeJFF5e5r1vA/GOtWjvhU
         WfTpX1hLBYJ+SqLP+3Rh0hg3VKodecWqRahu7kSMZliLSGIIjDdYSak8T9cqK49wa7Bt
         iZzKldRn07fw3winTOer0050BVigmD/8k7yFNnFtsL5iAfnRGOFZyn+LXNcOiayCjXWO
         Lfqk19Tb5wyBOz24V8meyGed4r5vlID/XxYtJ4fS2ko4kayUIQFs8Npd2zoF9xXQK4Zw
         aGwF2nbkn3YJ/zLQWuF21p5J0LqE/Zr589NsKTrIye6aMZg99NwLmhR0XHZWttJ494dT
         jkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KvOJfbt5FQZ7baGSdDJj7atyCETnrR2NiUmNORlt4ZY=;
        b=DDS7PDx1tJz2QIRVWeHmej2zX+T32DevtaIZVQ/gNBDrH84USY0gyHbUObJ6vAcGSO
         gFfpOejio0jNmNeW3EsdVRf3ZI35hVm+X8gI2eyGsAIEWUQ505so84H+Bx6ARdzlMEom
         rVhLCEJlffwQ0sElqJsT1M3rPoY4ZbsXIf6Ize/wKw9Dv4bRv+ULuGXCbIYxYdbvH96T
         V5eDK8sKtWjkWwJNsl1WFSXgeTYFzlTUjjDkRRyObNOiESQ9xdj+lFKJtnO2hFb5wk//
         fzhU3Max5NlQU6iOq3GmWelyzSwzGn0NWbvEUsWSg6kmvmy8e08wnJHe4I758UAr7TfT
         C/og==
X-Gm-Message-State: AOAM531SJQb1FCCGNLu/UlRfWXbK33I0n0IJjHz0lHuf9/oc1SCAsPo9
        SbBDcF6cdCFPdIDQkAQ05WweF/Svwb4=
X-Google-Smtp-Source: ABdhPJxpq/4wL6pbcapYwubjLwlXIR0pN88/KzQTlI0jPn3UMMro8QAvyC7zPaMnaIFldV64DbYdUQ==
X-Received: by 2002:a05:6a00:1742:b029:2cc:b1b0:731c with SMTP id j2-20020a056a001742b02902ccb1b0731cmr9170578pfc.15.1622894122969;
        Sat, 05 Jun 2021 04:55:22 -0700 (PDT)
Received: from odkf.hopto.org ([211.58.213.153])
        by smtp.gmail.com with ESMTPSA id p20sm3897126pff.204.2021.06.05.04.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 04:55:22 -0700 (PDT)
From:   Seongyong Park <euphoriccatface@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Seongyong Park <euphoriccatface@gmail.com>
Subject: [PATCH V2 0/2] media: video-i2c: additional support for Melexis MLX90640
Date:   Sat,  5 Jun 2021 20:54:55 +0900
Message-Id: <20210605115456.14440-1-euphoriccatface@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Previous attempt at re-submitting the patch(set) seems to have failed, due to a mishap at threading.
Here is another attempt.


