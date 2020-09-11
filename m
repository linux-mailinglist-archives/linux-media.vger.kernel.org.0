Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C741026683D
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 20:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbgIKS10 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 14:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgIKS1Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 14:27:24 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B32C061573
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2020 11:27:24 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id a8so9903310ilk.1
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2020 11:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=rvT7eaZA1MD6DhoY6vIGdKpG+Q7QpArg6P8zvYZBHdA=;
        b=iNmYN/BPN+qVUKdri5cL678nTQNAyCNncKrBUPsyPtHP5MTawxwKX66D9Qi7wP8n2W
         mQi9xN7JIiUdt4h7Db22A13Vc9MT8CG2SBIzELGJli+CYgVBDrWNIvruOsEvE1VX92L4
         hdgPiUmWYWypLLWSg3i0eLvYayWu0qJiWQe84whc43f+Pl40ouruzqBQk2VGtpzZQGcK
         Aouw6ONiswWCmXc+cMUgscieZxgTXmVodjwFsIyl+Rktk9agExCpPNrekV155VReyonz
         H0m/pHXvNINTGXR+v7AfiyzN3YKFq+qsqvV7E2wghy9/CGzsX1ql31mZPF3kiz2xCkrF
         NQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=rvT7eaZA1MD6DhoY6vIGdKpG+Q7QpArg6P8zvYZBHdA=;
        b=GMwAaZTLTizdx6rPfCfC5JZtD5HlFc7kYHyOF5sM6AlHmP4x40SsP+70NIbBCp/jCz
         1zy+PeUhoEntci940j8v0jRKBgZblkq+Q7PXf2P5rL065r7d+FVEjbCgMY6jCHJSFbnd
         rwc77FoTEbSp1kqVYbit+8L2K59HfBG+hxDqnkfaiP+kvtzuS0seliyakp8mL1YbNmjU
         VMRozw8A5MDJXdBYW0cKYcUOzkpxlfJufQ/z+QbPhZluI/mFUgNqZ5x6lCN6ZD2OZmOY
         5AKBiZqpgC07dn6px95/b5DIF1aHAkAhCjm9YkjlxaMEHcho5KajR/ptl1hcQFmJFb5P
         tSNQ==
X-Gm-Message-State: AOAM533QeNP4AxzjPVmWXWjVZNYeVGgIuw+Q4JVlFedgfhvk4l7x7qPs
        3ydg5ZRSc9Uv7f3f/HcVEXqoYS48GWJgcVRERmyRM/AhyuVO2YCk
X-Google-Smtp-Source: ABdhPJwJ9bjpab0Sr9vXXrUq2lVSMPwz3jQiy57WfnnfWwrbSnaR3SVzHLAohRRUmVdV3cjDITz4b/UTVjf3vcsj744=
X-Received: by 2002:a92:58cd:: with SMTP id z74mr2934834ilf.224.1599848841894;
 Fri, 11 Sep 2020 11:27:21 -0700 (PDT)
MIME-Version: 1.0
From:   Pavel Kuzmin <kuzkin@gmail.com>
Date:   Fri, 11 Sep 2020 21:27:11 +0300
Message-ID: <CAG+qv4KcntqO7sxfeF+bv594RbSjVQ9RMG8pLgncgkEXtxjmDg@mail.gmail.com>
Subject: edid-decode: Incorrect decoding of CTA extension if it does not
 contain padding bytes
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello


If in the EDID CTA extension the last 18 byte DTD block ends
immediately before the checksum byte (no padding bytes) then the last
DTD block is not processed and a failure is displayed "Padding:
CTA-861 padding contains non-zero bytes."

e.g. https://github.com/linuxhw/EDID/blob/master/Digital/Acer/ACR0549/42BFE4422CEF


Regards,
Pavel
