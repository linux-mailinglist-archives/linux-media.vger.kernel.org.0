Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A8E1B0EA3
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 16:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbgDTOim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 10:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730012AbgDTOil (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 10:38:41 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654E5C061A0C
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 07:38:41 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id b11so12470408wrs.6
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2020 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=K51721kWjoqYI2svOCO5KTnI+DawpvDaztsrQTQGHjU=;
        b=aiCZ8Xh/il7lZWbvBBnSdsu0owTIQA1HKbWqslnAmVj6OMtcfVRutEGoNR4XDu7yiI
         DukGFTytBSBQ4R4KvvlbI87GARE2n52rW/hB2OU8Q/i3J+uOqAy7XQdIZoC7YxBR8bFs
         CEG0qd/H2wxXnFPcj0JkmUIYQPDLF1tX0qZJ6AeL6+wJkxAa6bl8nIX9pk3WhlosSFBE
         pzwVHyBmriSzAqAY8Zl0S/nNtdnYt2U9yh6JoerxlF9yjrGRt8PSuULmPmw7GdfusqoJ
         Kf8JvTDKAkbGMXfxlafkgSLYN/8hHRP+mh5T2MgJYJXGYhY6O0ccAP7c+Ls2tItBtmfy
         lu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=K51721kWjoqYI2svOCO5KTnI+DawpvDaztsrQTQGHjU=;
        b=mKtIOE7BMcf0QJHUogec0yGgkw9gYrTFYaDSiRxW9OrpwDOV9RPslqUfgts77JuXFM
         MbhwRBmtjuMPHlBq+p8UDjXUL+Z49/Vf9WpOjDzZDQTYzYT1YplpjlZrb9J8cvB4sISi
         JWBYS7dNFH0xJX1jC6lGMSWmdXbpd23Kp8BbP5MWqh4FNnwi9gp8Uogm74GPiuiyJuTw
         3Lpf2mVOWggjZqiHs/5AzfSO6OAAIqMFOqoLJVAk0lyBYSVixB38bNrMjILYgaj8Atyx
         8oRosg/Hoj9d3plzUfhJ2DsLgryQswoXJ5u8j6ZmPm3po4FSZWjBp1KkMqPlob0cKs2J
         9qWA==
X-Gm-Message-State: AGi0PubDSBLZykLcHyT4n73rX1JYRPvu7fS31x+KqXy8GVPA1mcL1B2H
        EAEy7ct7WbQtPK4IVn1bOJ4AOg==
X-Google-Smtp-Source: APiQypJlaaYqWa3WqWzIqmr5ILybGCrXV7p1nBCVJEOklp2eACLAVYjiXf9sNJrIU/m3o6WO4a6A9A==
X-Received: by 2002:adf:ab1b:: with SMTP id q27mr17292540wrc.220.1587393520137;
        Mon, 20 Apr 2020 07:38:40 -0700 (PDT)
Received: from [192.168.1.5] (212-5-158-142.ip.btc-net.bg. [212.5.158.142])
        by smtp.googlemail.com with ESMTPSA id t17sm1478767wro.2.2020.04.20.07.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 07:38:39 -0700 (PDT)
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: decode sync frames only
Message-ID: <9a58a501-8348-2230-2ab5-534471d866ca@linaro.org>
Date:   Mon, 20 Apr 2020 17:38:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I need to port a decoder v4l2 control in mainline Venus driver which
instructs the decoder to decode sync frames only (I frame/ IDR frame).
In practice the usage of such control is to generate thumbnails for
particular video.

To do that I researched what we have currently in v4l2-controls.h and
found something similar but for encoders:

V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME
"Force a key frame for the next queued buffer. Applicable to encoders.
This is a general, codec-agnostic keyframe control."

I think I have two options:

1. reuse V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME for the decoder and document it

2. create a new v4l control V4L2_CID_MPEG_VIDC_VIDEO_SYNC_FRAME_DECODE

Any suggestions?

-- 
regards,
Stan
