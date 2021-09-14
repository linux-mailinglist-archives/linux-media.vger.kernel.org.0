Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD5040A7A0
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 09:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240910AbhINHhM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 03:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241254AbhINHgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 03:36:41 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851BFC0613E4
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 00:34:40 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z94so12178262ede.8
        for <linux-media@vger.kernel.org>; Tue, 14 Sep 2021 00:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=zOGlSIy8B1vp56lzBYiSh7wZlv/SSop9d8aF2dsc3fc=;
        b=bbqq9a86z3BraCK/E7usWjrW2UseW+Pi1OGLm0uKjF5Z4mZQ5Zz52DydQQWM0+vl4S
         bve9nGpUUFNdJUGU5CaOJfgLBlOGnxdzq2onug9936NrL81vB/uG6U1CAXEyfvj1Dgsb
         YFWl/IilXv1hcS7/Gr3Wn0JQ5KfPyABjR+GYR2qOZ+Bf0t6reyJ+xy+NNSnXsKK4RxZF
         nZCbG1jI4pPCTuEfa4zcLuFJQotM8BpFSZENEFzAYzC2tRGcu6XZcotKPW9nHtTs5mhj
         9mXRw9lhZf54VssZTSGj9wWC/sXWige9nZdKEFdpPl7+UUhKQjmpOWl4FU3ejA4SNftM
         Qgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=zOGlSIy8B1vp56lzBYiSh7wZlv/SSop9d8aF2dsc3fc=;
        b=pkTie48YbQMyIfbagVoSV00ZxqbCTAJueMJsWPxT9IlrPD5bX8e4Rkuq4Q3yn04MCo
         c4OMlKD1cOsPvRg7j/U/z4GLdpJXXLD0pEGk8lJX0r57bXTZWPCiMIYfnN8yDq1KXH88
         ygLLX0fh/DQfT5Z9BXFhH6eXeVTBh5ltb/czaf3eVtvoYfhMMkVBz9zXTqUYRv9PjZbn
         6y8IxyVXzpi2HXmFAh4XjvI7ZTHTGFuylMYkahDsdqR1QpI/r5EnzXV2Jf4RrLuBQ9Ff
         +VmOzOyyrf5KBfXzHrxvimNI3lRLxTfxHXb/Xp8NnPxBEWQqyN/8IX0ecODaDjPz+1QM
         aFjg==
X-Gm-Message-State: AOAM532o6riPGFwzPfqxpqaHmG1n2SAPnZxnwg5eS3CGI9E5n8GT2h3X
        BqKicg74bNxCkquwwf6wvUsq6I4EbKQpdsnjk5632F79E5M=
X-Google-Smtp-Source: ABdhPJxi35xx21VmeSBicU3yyaBd4SOe6m9e0gNFEYhtxBlJvmgrDrPh/HMDaBgTt0sxPGF52wNMaE+ZFyQdNebpyAk=
X-Received: by 2002:a05:6402:897:: with SMTP id e23mr17757411edy.366.1631604878992;
 Tue, 14 Sep 2021 00:34:38 -0700 (PDT)
MIME-Version: 1.0
From:   Chuck Ritola <cjritola@gmail.com>
Date:   Tue, 14 Sep 2021 03:34:03 -0400
Message-ID: <CA+RexfHjBZzFst=x6OEhBn-d_J=JCTy7tPyemd-g=b=J=sVVZw@mail.gmail.com>
Subject: dvbv5-based DiseqC 1.2 dish rotor control from command line
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, I have a few questions involving the dvbv5 tools:

How would one send DiSEqC 1.2+ rotor control commands using the
command line? I found an old discussion
(https://www.linuxtv.org/pipermail/linux-dvb/2006-October/013435.html)
suggesting xdipo, however I get a build error about unrecognized
symbol involving XSync. Before continuing to try and fix it I
considered that ilinux-media has changed a lot since 2006 and the
application might not even work.

In dvbv5-zap, does the -S option described as "Satellite number" in
the help mean the operation  of a DiSEqC LNB switcher? Is there
rotator support?

Am I correct that the physical layers of DiSEqC 1.0 and 1.2 are
effectively the same, and that the difference is in the commands sent
over said layers from software? I'm using a Hauppauge PCTV 461e, which
is advertised to have DiSEqC 1.0 support only. However, its board has
a Montage Technology M88DS3103, which, according to linuxtv, is
capable of 2.0+. I haven't found a datasheet for the chip. Perhaps the
advertised limitation has to do with the windows software that came
with the stick?

I'm trying to automatically turn a DiSEqC rotor and control the 461e
using dvbv5-zap via a script. It's all going fine except I haven't
figured out how to send the DiSEqC to turn the rotor.
