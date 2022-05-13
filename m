Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26EA9525FC4
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 12:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379519AbiEMKi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 06:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237341AbiEMKi1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 06:38:27 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B540160ABD
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 03:38:26 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 580FB1B003E5
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 13:38:24 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1652438304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=V/udHH2BKb7Dvj5W/aaJo3o1xcu+TJygPOPY8VAycjk=;
        b=YovPGmhZbjd91wzra6BEueUvocTmnVkELgK2Gjr59RpRATpAmOWU5+9Bb/94jpgrcAO2Qj
        wiq6n4AiW7hFWzccpyaki4mwbW2PHRnNNyFk9VEtSbDWSj56POvms5Pa3bQ++/IXQkVZT/
        6eGQjNCRZCihUuSj9jB6v7bn4nLbyTuqBw+axm58eCdruqSZQh+7Oo70ZzkaDVcwp5hrrZ
        FPkaOQ8eyiZtw+eYiK9epMcm9+5AoybG2rRfBvEtrtxTC9tt3bfb+xdedFykfy0q/s+OC3
        n16nrxBaKbIRZe260ow752E/ON7i2/JZ+3vnsNor7RlQqVtTcoFilGUfefbyBg==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id EB057634C91
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 13:38:23 +0300 (EEST)
Date:   Fri, 13 May 2022 13:38:23 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.19] Ov5640 driver improvements
Message-ID: <Yn41HyGCOJyZU98T@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1652438304; a=rsa-sha256;
        cv=none;
        b=londcs+g22EMkQ2i29TFuvfI/OXR+hrz6AGYGkzg/O1X+IBB1mKD2eTBUCsGXtu6O286ck
        vrK8oyJmXUs8/7mkgXEqxZNhkzzuwWa63vtcHRqaiNeHbFFmn6h9t63nLR7+BfJKhdgv4Q
        uSfy/5ruSs5Da0fu+NHbrt95H5B3qdABClCr2fKbzRGKL2B0szdVcGNORg2NjPckC84zZd
        gvB9ZO+tSPCYIuJAV5Y0ps64kmE5oFmM/08Hqt75ext5bK56VbGVXak3e4sSeU0y9Ieva0
        wB/sFhAZIy9cr+e7K6ERgs9j4pZuegyR1KdjjTu3js8GXRKNR3r/kQe5GfRSMw==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1652438304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=V/udHH2BKb7Dvj5W/aaJo3o1xcu+TJygPOPY8VAycjk=;
        b=hPcqJyQ+ErVlTbljTJi7KL7LtsSb4KVv0/NjuPM/BgSUDY3ptsJdjHKXxjSfJFKrfYdHVn
        nCtFTvFjYXXEqgx7665bpVNlksgLYOfT5DgrTP5LyOa7FQx2aCJrf0epjmcuJl5qc1WfH4
        Z2xkZIaYIxQe7LJ+N5hehdw4XMQ/+0lKS/Nj7MGQ5FyILPPl1tJMwwW2SlzswWxz7OW/eW
        yAgZv9swaQg8GmnKCBK8wLp2r31HIwjusBTNWKe9sUe5gEKd83U012DOtuOCHZ2rE+uWBx
        mgk2IL4ggUEDfv15RSdTt6Mexuqrd8VaCN9OoKoYksXS58ZDVeKZy4O7EXqoHg==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

One more pull request. This contains the ov5640 driver improvements Jacopo
has been working on for quite some time.

Please pull.


The following changes since commit 6c1c1eb8c87de221051b9198d40971640060842f:

  media: ext-ctrls-codec.rst: fix indentation (2022-04-25 23:55:02 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.19-3-signed

for you to fetch changes up to 8dd4316b66ace25bfd31c943f146b665ff48dd0e:

  media: ov5640: Move format mux config in format (2022-05-13 12:29:17 +0300)

----------------------------------------------------------------
ov5640 driver improvements for 5.19

----------------------------------------------------------------
Hugues Fruchet (1):
      media: ov5640: Adjust vblank with s_frame_interval

Jacopo Mondi (27):
      media: ov5640: Add pixel rate to modes
      media: ov5640: Re-arrange modes definition
      media: ov5640: Add ov5640_is_csi2() function
      media: ov5640: Associate bpp with formats
      media: ov5640: Add LINK_FREQ control
      media: ov5640: Update pixel_rate and link_freq
      media: ov5640: Rework CSI-2 clock tree
      media: ov5640: Rework timings programming
      media: ov5640: Fix 720x480 in RGB888 mode
      media: ov5640: Split DVP and CSI-2 timings
      media: ov5640: Provide timings accessor
      media: ov5640: Re-sort per-mode register tables
      media: ov5640: Remove duplicated mode settings
      media: ov5640: Remove ov5640_mode_init_data
      media: ov5640: Add HBLANK control
      media: ov5640: Add VBLANK control
      media: ov5640: Remove frame rate check from find_mode()
      media: ov5640: Change CSI-2 timings to comply with FPS
      media: ov5640: Implement init_cfg
      media: ov5640: Implement get_selection
      media: ov5640: Register device properties
      media: ov5640: Add RGB565_1X16 format
      media: ov5640: Add BGR888 format
      media: ov5640: Restrict sizes to mbus code
      media: ov5640: Adjust format to bpp in s_fmt
      media: ov5640: Split DVP and CSI-2 formats
      media: ov5640: Move format mux config in format

 drivers/media/i2c/ov5640.c | 1650 +++++++++++++++++++++++++++++++-------------
 1 file changed, 1188 insertions(+), 462 deletions(-)

-- 
Sakari Ailus
