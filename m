Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE8620C835
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2020 15:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbgF1NXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jun 2020 09:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgF1NXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jun 2020 09:23:23 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ADB4C061794
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2020 06:23:23 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id gc9so427927pjb.2
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2020 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NoHXUHnUsVm5HyNBYQdccjOBYTP31IkdxzIa7CkwHU0=;
        b=dniRoBlXjTHWj2AmY/yiSDuT/6rbxRV1oxoMRQMx/lrcqtv3kuTLNhvmWffkCAdSAN
         D3Acnm3csOuY8HPqGZz1HyvTTBnfFxzunrTfO9f0FXHexK+KpAmZeF0bh7FpOIGOBS+H
         TfBQwomcMQE6Uvqa6/EFePXI6jVgKplx49BcAjtY2jDfLezQam3yRQD0/dmaX8XEjIDB
         Ugr5FMaDKGJHVLcb+eB+ZxADZ6J3EL0WCgIsl3BQMVX8cAwaypYFY3+tKtOmyY1DBIgF
         pV1JOdz5SEwtv+Y2x6FPPpz0EM4umTLFuDAm0j8ZesdQSMeAHeoVeFhEvpzVmZHb9Ok9
         fcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NoHXUHnUsVm5HyNBYQdccjOBYTP31IkdxzIa7CkwHU0=;
        b=XV54+zudCNR4h2iru5l9aobhdMGusV+PVwJQQ2Y7JYm02TWX+ebdEmUemmmJFlvcaq
         fSVZrd7W2AUbrnSMtrpcCUAOGkwRtH4oMTeTZErSpFeL36XLGgYiW0e2hkAVMEuaFNXN
         80YHHRn1FShxH1oG5WwHlF5PaBaU3+4HKDZRmv5Gn6qo6z01Szn5hDYZsYE7YCBy/Vnp
         0Dpq4eD0bH04TUn+IDFekLCNqncYdJHHZKR01ahn9xfLWbhakCd9NO1Ss0grQs9DiJVV
         kFfYjcl1KI6MkJAixaV4tH8qwYB3VzK0PFFuS7Anl/1LfJgE4Hrqv4HLkkfv8XUlgwL9
         YIrg==
X-Gm-Message-State: AOAM532kHco/siFw7DTmHqwsEj6QF/FHDvUas90g+wPyJfKwe6aeRaqT
        tQnhgBXS/ZuZ3H8mhFhBvo19wqnndqVF7A==
X-Google-Smtp-Source: ABdhPJxEjUiw6NPgCwmULT355GwccZB8NlPIU/yJiZuj8gYupreOxC8gj2Rz7RGQOz+euwj/h+RLLQ==
X-Received: by 2002:a17:90a:1e:: with SMTP id 30mr12037740pja.25.1593350602321;
        Sun, 28 Jun 2020 06:23:22 -0700 (PDT)
Received: from localhost.localdomain ([122.128.43.5])
        by smtp.gmail.com with ESMTPSA id z1sm16545575pjz.10.2020.06.28.06.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 06:23:21 -0700 (PDT)
From:   Hyunwoo Park <hyunwoo.park@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Hyunwoo Park <hyunwoo.park@gmail.com>
Subject: [PATCH 0/1] Add atsc/kr-Cable-8VSB
Date:   Sun, 28 Jun 2020 22:21:55 +0900
Message-Id: <20200628132156.15402-1-hyunwoo.park@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Send patch for Korean cable DTV scan table to
https://git.linuxtv.org/dtv-scan-tables.git/ git repository.

Hyunwoo Park (1):
  Add atsc/kr-Cable-8VSB

 atsc/kr-Cable-8VSB | 961 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 961 insertions(+)
 create mode 100644 atsc/kr-Cable-8VSB

-- 
2.26.2

