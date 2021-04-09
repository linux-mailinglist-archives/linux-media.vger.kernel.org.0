Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 621AE359843
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 10:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232354AbhDIIsE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 04:48:04 -0400
Received: from smtprelay0238.hostedemail.com ([216.40.44.238]:43082 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232387AbhDIIsC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 04:48:02 -0400
X-Greylist: delayed 419 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Apr 2021 04:48:02 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 689971815318E
        for <linux-media@vger.kernel.org>; Fri,  9 Apr 2021 08:40:50 +0000 (UTC)
Received: from omf17.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 1E804181CB2D4;
        Fri,  9 Apr 2021 08:40:49 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id E63D027DD11;
        Fri,  9 Apr 2021 08:40:46 +0000 (UTC)
Message-ID: <05802da66d3751611b85eb63d566220e09ef4bb7.camel@perches.com>
Subject: Re: [PATCH] staging: media: meson: vdec: matched alignment with
 parenthesis
From:   Joe Perches <joe@perches.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mitali Borkar <mitaliborkar810@gmail.com>,
        narmstrong@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, khilman@baylibre.com,
        jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
        mitali_s@me.iitr.ac.in
Date:   Fri, 09 Apr 2021 01:40:45 -0700
In-Reply-To: <479be6a4-2e6f-98a6-045f-d7c2132137c4@xs4all.nl>
References: <YG+Bcqxetfj98l6V@kali>
         <479be6a4-2e6f-98a6-045f-d7c2132137c4@xs4all.nl>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.60
X-Stat-Signature: 3wzrfrdy5sxkqd6b68tqw46b31ozb1s4
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: E63D027DD11
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX186Cki4iz9kgGIdAcl84qUVMxED1MeG/h8=
X-HE-Tag: 1617957646-625853
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-04-09 at 09:30 +0200, Hans Verkuil wrote:
> On 09/04/2021 00:19, Mitali Borkar wrote:
> > Matched alignment with open parenthesis to meet linux kernel coding
> > style.
> > Reported by checkpatch
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > index 48869cc3d973..21e93a13356c 100644
> > --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > @@ -81,7 +81,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
> >  	}
> >  
> > 
> >  	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
> > -					(u32[]){ 8, 0 });
> > +				  (u32[]){ 8, 0 });
> 
> The alignment here is because the 2nd and 3rd arguments belong together, so
> the alignment indicates that. In order to keep that I would add a newline
> after 'sess,' as well. Same as is done in meson/vdec/codec_h264.c.

Perhaps better as:

---
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 5 +++--
 drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
 drivers/staging/media/meson/vdec/vdec_helpers.h | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 48869cc3d973..933f1cd16ce1 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -65,6 +65,8 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
 	struct amvdec_core *core = sess->core;
 	struct codec_mpeg12 *mpeg12;
 	int ret;
+	static const u32 canvas1[] = { AV_SCRATCH_0, 0 };
+	static const u32 canvas2[] = { 8, 0 };
 
 	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
 	if (!mpeg12)
@@ -80,8 +82,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
 		goto free_mpeg12;
 	}
 
-	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
-					(u32[]){ 8, 0 });
+	ret = amvdec_set_canvases(sess, canvas1, canvas2);
 	if (ret)
 		goto free_workspace;
 
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index 7f07a9175815..df5c27266c44 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -177,7 +177,7 @@ static int set_canvas_nv12m(struct amvdec_session *sess,
 }
 
 int amvdec_set_canvases(struct amvdec_session *sess,
-			u32 reg_base[], u32 reg_num[])
+			const u32 reg_base[], const u32 reg_num[])
 {
 	struct v4l2_m2m_buffer *buf;
 	u32 pixfmt = sess->pixfmt_cap;
diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
index cfaed52ab526..ace8897c34fe 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.h
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
@@ -17,7 +17,7 @@
  * @reg_num: number of contiguous registers after each reg_base (including it)
  */
 int amvdec_set_canvases(struct amvdec_session *sess,
-			u32 reg_base[], u32 reg_num[]);
+			const u32 reg_base[], const u32 reg_num[]);
 
 /* Helpers to read/write to the various IPs (DOS, PARSER) */
 u32 amvdec_read_dos(struct amvdec_core *core, u32 reg);

