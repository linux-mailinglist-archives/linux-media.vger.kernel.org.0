Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1173E344511
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 14:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbhCVNLh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 09:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232726AbhCVNJm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 09:09:42 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697DAC061756
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 06:09:37 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 15so21020242ljj.0
        for <linux-media@vger.kernel.org>; Mon, 22 Mar 2021 06:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=MkCp0+1BVFjaQ2nx7WYtpRIFT0uvC4CYRrIvU/PIPGc=;
        b=azSCGL5SviMUD9pXOjnYEk+VPcTK7TMBpT+C7C5wmihcApPWU0GqS/lrk/lcD/AGEg
         Qf0gAYv9mj/2w939cwcRNj6hdeYMYOxhOn8b11Y9xp0Z+VDI98vpgEulWxiXN3VG/YvG
         1V8kdbs41S8rKolcZ5zI/fLEjAwK3EQeQEsZkq4nC633G1X8ktpwnjeI5vEq2WJhv6TY
         YHpKSAsSGNPJefovF/tDlQryES5621CkdexaR5XL1LA7diziQa+943DLG4AC7+tlyeR2
         NjQ4hoEG+4KxKGfbEix/VEhvD6IdC+Ip1TcNty7pM9FFFWLp1dRh9Tld7LbjhwIaGfGC
         U+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=MkCp0+1BVFjaQ2nx7WYtpRIFT0uvC4CYRrIvU/PIPGc=;
        b=kk9QHWnWBBv9imGk+yo+F7QO0pBs7moSshPkGSzXndqg5ks0mLhdFM5KYaVRXEexXO
         Ilu4cNE7/yP8+P8c2SqGvqV8NpaxechyRK2F7SHHAF2k8aEaHL/Iy9z1y/jmT2CcGDae
         imbI/F1Eza2E8CgN3I2XzDgbhIZdcc2aNqNhRNWhWaXbcReyYOnIJIaKu7sS3EiedF0Y
         qUx7Yp/2zkI71iNuk2vAAv/HYTWBcQCrT66HPm0V49Lv8nkvHmbJ2h//zErzPcB5GjE/
         XDY3e8DcacJJm/hcBBDbMtlFbOZ6L8FMI+EZLI2JMP8cwb/SVvsC8B2yazI6Bn//uYlE
         jXwQ==
X-Gm-Message-State: AOAM532CTno313l43rkw/HmYrECBdSJh43vi31a7TrLEwxDM3K4aigpe
        crOODvt3qyUzykyNZaXg/0JwSS6Ymfx1OZwYNTk=
X-Google-Smtp-Source: ABdhPJyBZ9rmORm0y6Nlrfjau8NvCWG0cGYMZ7ow99mNKbCm+rT8JJNF4Ai3Ny+AhldUdzcD/9h4Z8hozE27yP1zEHA=
X-Received: by 2002:a2e:9a0c:: with SMTP id o12mr9399290lji.121.1616418575949;
 Mon, 22 Mar 2021 06:09:35 -0700 (PDT)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 22 Mar 2021 10:09:24 -0300
Message-ID: <CAOMZO5DQq0vSkQuikYXxkKofkukGkwE=CBW10+eDPib2vRSHvg@mail.gmail.com>
Subject: [REGRESSION] video-mux: Probe error on imx6
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

When running kernel 5.12-rc4 on imx6, video-mux fails to probe like this:

[    5.675490] video-mux: probe of 20e0000.iomuxc-gpr:ipu1_csi0_mux
failed with error -107
[    5.685226] video-mux: probe of 20e0000.iomuxc-gpr:ipu2_csi1_mux
failed with error -107

I haven't started investigating this problem yet, but just wanted to
let you know in case you have any suggestions.

Thanks,

Fabio Estevam
