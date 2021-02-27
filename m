Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12B4326C35
	for <lists+linux-media@lfdr.de>; Sat, 27 Feb 2021 09:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhB0IOG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Feb 2021 03:14:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhB0IOC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Feb 2021 03:14:02 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBAE5C061786
        for <linux-media@vger.kernel.org>; Sat, 27 Feb 2021 00:13:21 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id hs11so18618990ejc.1
        for <linux-media@vger.kernel.org>; Sat, 27 Feb 2021 00:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=9KcA5WpOziOR3ShXSDVAL2arU2S81Mdfo6lkYkQVxBU=;
        b=kohoCNnDXLqD57EBCcuByB5UNXG6nJgf5pBLaAlXyxuyaEK1ftLOZaysIdc55NY41/
         KWAWKprVcbLIpHUv1pv0Nvnlj+yUTDvj/CtCo43smhFs85VW6blYTkZWOkQqaWCzTr2z
         sbCzlKDummhgRGW7hWUTIXbEq8f203cGCUyrEb7HxEpdwaxkawPJ0RP09LBQMuQw89z/
         tipjKd0+1/JTHIOj1y2LLvUGhL+qP/MKMiGfIaLJiZvNd9+hC2VMbSqeA7sbGffRJ20m
         96JtuEUltukAmwOIGpkMGTltKPxCmVuWDPkPrnV5iVDX7wHdCRUPOaagOj1WlTo/+d0j
         9ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=9KcA5WpOziOR3ShXSDVAL2arU2S81Mdfo6lkYkQVxBU=;
        b=ukByL0KFW8lTzCuMOMyG63EDRo5CA488wY/r4LlOWETlQo5v25JcU7cbq1RBnNXa6J
         XnqhB5b1KsS9UHi3ubiYJ2BEywqebO9qce3OaaE7btZEiNJr/yuycXD+GiQFMWRN2IBj
         iz8Z8ooMsFU15VWG/+MIIudEPz/aIWtmdaAKwiRrZXLIGhmN9lJtk7REG2aA9e4XyCJz
         mb0lbeumznWwMK4nT7zzD9V0/RYBAoF/G+aT22JCLZFcoQZJZX7EWxG2+YAhM3I/WvaY
         6tkHEVm2qrYaK0v/G96gLTdwGH6NkLPiAffye7F0BwR58xyyids9arsMtqtRsO3yqWY5
         C2jA==
X-Gm-Message-State: AOAM5317/vJKtfgp4dIYqGPFdXwOZ2do7MbBqJeen6gM87/VSGmRChU/
        KRYWnJMzjJkQAjpb4fpbdjtpPdni9ok4bt2PjrRVRtORONiDaOsb
X-Google-Smtp-Source: ABdhPJymtUrDfARvAJvydoP8kZ4Vyu8X/w3P/+YVI3fotUQ7m7oQOQTcj3mS6879yhQxiurubztkADwkFzi3laqKFxY=
X-Received: by 2002:a17:906:b249:: with SMTP id ce9mr7132858ejb.294.1614413600514;
 Sat, 27 Feb 2021 00:13:20 -0800 (PST)
MIME-Version: 1.0
From:   Zhengyang Feng <zyfeng97@gmail.com>
Date:   Sat, 27 Feb 2021 16:13:10 +0800
Message-ID: <CAK80=wOGYgKVqhCO+jcYCvYy-aC_qS74y8PuQ3ck=965qtUJvg@mail.gmail.com>
Subject: Request for a UVC camera driver
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear maintainers,

I'm using a UVC camera, it works fine on windows but fails on
Ubuntu 20.04.

-- 
Yours sincerely,
Zhengyang
