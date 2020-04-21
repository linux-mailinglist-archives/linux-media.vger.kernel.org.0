Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4CF31B1FE2
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 09:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgDUHbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 03:31:37 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:38225 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725989AbgDUHbh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 03:31:37 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id QnNTj5rRF7xncQnNWjJQQy; Tue, 21 Apr 2020 09:31:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587454294; bh=NUrMA6NxhIdhytOAtAm1iaRd9CJs2N3vDgfr4dFEPK8=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QkS/QLpRzrV+Z+2u/aQL663dHGk1U7DLXH/ETWWAnxFIVedq8FhXDOJBCXBOqcFZ3
         e45HFCO8mDrQpPcQ9sZ55IExLt2Sk+jLj9GCAS2dbl+UO0mZN7uXK8JoGxhIJtafvq
         NlOmOMtZ+qOxmkfx5CYXXN8sSSjcn4S826LUN6Q7nha3L0vcW5MHaoOl2FgO/s35yt
         9mAdeevKp7aNzyp9s8lANCNENx0rtcybV2JgCskJFm0WSp0Ot9125AeIclDVooYBC7
         ab1+8jnOsGOjBXEQa1dxQEuTF8DWKfAW+nTLBFWV6zH9HQNkNO+83ao8cgL1eWcnL9
         qNx56wZ3cxxeA==
Subject: Re: [PATCH 3/7] treewide: fix wrong *cmp function usage
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20200420184649.4202-1-rosenp@gmail.com>
 <20200420184649.4202-3-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0991c8c0-b5a0-7860-b3c8-8045496b305c@xs4all.nl>
Date:   Tue, 21 Apr 2020 09:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200420184649.4202-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA1T3NyK/KMN75Cx39l4xeCHd/fzskfo8OQNIkJJVFBqLbCYKB/WWFvtHPLcvWQzMBmBsFliYfIXPSGQAE9abFwHSaWdHFtxT5TTRqS6cwVa/2k2QTxl
 qh9egMX0/5VVysnlTvwshPoYUbqNvsHNjfYEYe/+lxiY9FMj5T6bLqsLbbFgT8f0+sFxi3ZLLPETWnTAn9UNVIct5msgzs93gIw=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/04/2020 20:46, Rosen Penev wrote:
> Found with bugprone-suspicious-string-compare
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  lib/libdvbv5/countries.c                    |  2 +-
>  lib/libdvbv5/dvb-dev-remote.c               |  4 ++--
>  lib/libdvbv5/parse_string.c                 |  4 ++--
>  lib/libv4l2rds/libv4l2rds.c                 |  6 +++---
>  utils/cec-compliance/cec-test-adapter.cpp   |  2 +-
>  utils/cec-compliance/cec-test.cpp           |  8 ++++----
>  utils/cec-ctl/cec-ctl.cpp                   |  2 +-
>  utils/common/media-info.cpp                 |  4 ++--
>  utils/dvb/dvbv5-daemon.c                    |  2 +-
>  utils/dvb/dvbv5-scan.c                      |  2 +-
>  utils/ir-ctl/ir-ctl.c                       |  4 ++--
>  utils/keytable/keytable.c                   |  6 +++---
>  utils/libmedia_dev/get_media_devices.c      |  4 ++--
>  utils/media-ctl/libmediactl.c               |  2 +-
>  utils/media-ctl/libv4l2subdev.c             |  2 +-
>  utils/v4l2-compliance/v4l2-compliance.cpp   | 18 +++++++++---------
>  utils/v4l2-compliance/v4l2-test-buffers.cpp |  4 ++--
>  utils/v4l2-compliance/v4l2-test-media.cpp   | 16 ++++++++--------
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp |  4 ++--
>  utils/v4l2-ctl/v4l2-ctl-common.cpp          |  2 +-
>  20 files changed, 49 insertions(+), 49 deletions(-)

This is standard C/C++ idiom, changing this is nonsensical.

Regards,

	Hans

> 
> diff --git a/lib/libdvbv5/countries.c b/lib/libdvbv5/countries.c
> index 609add0b..c5682365 100644
> --- a/lib/libdvbv5/countries.c
> +++ b/lib/libdvbv5/countries.c
> @@ -395,7 +395,7 @@ enum dvb_country_t dvb_guess_user_country(void)
>  			continue;
>  
>  		if (! strncmp(buf, "POSIX", MIN(strlen(buf), 5)) ||
> -		    ! (strncmp(buf, "en", MIN(strlen(buf), 2)) && !isalpha(buf[2])) )
> +		    ! (strncmp(buf, "en", MIN(strlen(buf), 2)) != 0 && !isalpha(buf[2])) )
>  			continue;
>  
>  		buf = strdup(buf);
> diff --git a/lib/libdvbv5/dvb-dev-remote.c b/lib/libdvbv5/dvb-dev-remote.c
> index ebb1bdb7..643ca559 100644
> --- a/lib/libdvbv5/dvb-dev-remote.c
> +++ b/lib/libdvbv5/dvb-dev-remote.c
> @@ -733,7 +733,7 @@ static void *receive_data(void *privdata)
>  
>  			handled = 1;
>  
> -			if (strcmp(msg->cmd, cmd)) {
> +			if (strcmp(msg->cmd, cmd) != 0) {
>  				dvb_logerr("msg #%d: Expecting '%s', got '%s'",
>  						seq, msg->cmd, cmd);
>  				free_msg(dvb, msg);
> @@ -792,7 +792,7 @@ static int dvb_remote_get_version(struct dvb_device_priv *dvb)
>  		goto error;
>  	}
>  
> -	if (strcmp(version, daemon_version)) {
> +	if (strcmp(version, daemon_version) != 0) {
>  		dvb_logerr("Wrong version. Expecting '%s', received '%s'",
>  			daemon_version, version);
>  		ret = 0;
> diff --git a/lib/libdvbv5/parse_string.c b/lib/libdvbv5/parse_string.c
> index d354f497..b3518291 100644
> --- a/lib/libdvbv5/parse_string.c
> +++ b/lib/libdvbv5/parse_string.c
> @@ -348,7 +348,7 @@ static void charset_conversion(struct dvb_v5_fe_parms *parms, char **dest, const
>  		*p = '\0';
>  
>  		/* If desired charset is not UTF-8, prepare for conversion */
> -		if (strcasecmp(parms->output_charset, "UTF-8")) {
> +		if (strcasecmp(parms->output_charset, "UTF-8") != 0) {
>  			tmp = (unsigned char *)*dest;
>  			len = p - *dest;
>  
> @@ -391,7 +391,7 @@ void dvb_parse_string(struct dvb_v5_fe_parms *parms, char **dest, char **emph,
>  	 * Strings in ISDB-S/T(JP) do not start with a charset identifier,
>  	 * and can start with a control character (< 0x20).
>  	 */
> -	if (strcasecmp(type, "ARIB-STD-B24") && *src < 0x20) {
> +	if (strcasecmp(type, "ARIB-STD-B24") != 0 && *src < 0x20) {
>  		switch (*src) {
>  		case 0x00:	type = "ISO-6937";		break;
>  		case 0x01:	type = "ISO-8859-5";		break;
> diff --git a/lib/libv4l2rds/libv4l2rds.c b/lib/libv4l2rds/libv4l2rds.c
> index 2e67d060..a053adea 100644
> --- a/lib/libv4l2rds/libv4l2rds.c
> +++ b/lib/libv4l2rds/libv4l2rds.c
> @@ -920,7 +920,7 @@ static uint32_t rds_decode_group2(struct rds_private_state *priv_state)
>  			if (segment == 0x0f) {
>  				handle->rt_length = 64;
>  				handle->valid_fields |= V4L2_RDS_RT;
> -				if (memcmp(handle->rt, priv_state->new_rt, 64)) {
> +				if (memcmp(handle->rt, priv_state->new_rt, 64) != 0) {
>  					memcpy(handle->rt, priv_state->new_rt, 64);
>  					updated_fields |= V4L2_RDS_RT;
>  				}
> @@ -937,7 +937,7 @@ static uint32_t rds_decode_group2(struct rds_private_state *priv_state)
>  				handle->rt_length = 32;
>  				handle->valid_fields |= V4L2_RDS_RT;
>  				updated_fields |= V4L2_RDS_RT;
> -				if (memcmp(handle->rt, priv_state->new_rt, 32)) {
> +				if (memcmp(handle->rt, priv_state->new_rt, 32) != 0) {
>  					memcpy(handle->rt, priv_state->new_rt, 32);
>  					updated_fields |= V4L2_RDS_RT;
>  				}
> @@ -954,7 +954,7 @@ static uint32_t rds_decode_group2(struct rds_private_state *priv_state)
>  			priv_state->new_rt[i] = '\0';
>  			handle->rt_length = i;
>  			handle->valid_fields |= V4L2_RDS_RT;
> -			if (memcmp(handle->rt, priv_state->new_rt, handle->rt_length)) {
> +			if (memcmp(handle->rt, priv_state->new_rt, handle->rt_length) != 0) {
>  					memcpy(handle->rt, priv_state->new_rt,
>  						handle->rt_length);
>  					updated_fields |= V4L2_RDS_RT;
> diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
> index 0675ccb7..27c742b3 100644
> --- a/utils/cec-compliance/cec-test-adapter.cpp
> +++ b/utils/cec-compliance/cec-test-adapter.cpp
> @@ -193,7 +193,7 @@ static int testAdapLogAddrs(struct node *node)
>  	fail_on_test(laddrs.log_addr_mask == 0);
>  	for (unsigned i = 0; i < laddrs.num_log_addrs; i++) {
>  		fail_on_test(laddrs.log_addr[i] == CEC_LOG_ADDR_INVALID);
> -		fail_on_test(memcmp(laddrs.features[i], features, 4));
> +		fail_on_test(memcmp(laddrs.features[i], features, 4) != 0);
>  		fail_on_test(check_0(laddrs.features[i] + 4, 8));
>  	}
>  	for (unsigned i = laddrs.num_log_addrs; i < CEC_MAX_LOG_ADDRS; i++) {
> diff --git a/utils/cec-compliance/cec-test.cpp b/utils/cec-compliance/cec-test.cpp
> index 9a08f54b..4aa54afc 100644
> --- a/utils/cec-compliance/cec-test.cpp
> +++ b/utils/cec-compliance/cec-test.cpp
> @@ -116,7 +116,7 @@ int system_info_get_menu_lang(struct node *node, unsigned me, unsigned la, bool
>  	if (cec_msg_status_is_abort(&msg))
>  		return OK_PRESUMED;
>  	cec_ops_set_menu_language(&msg, language);
> -	fail_on_test(strcmp(node->remote[la].language, language));
> +	fail_on_test(strcmp(node->remote[la].language, language) != 0);
>  
>  	return 0;
>  }
> @@ -319,7 +319,7 @@ int device_osd_transfer_give(struct node *node, unsigned me, unsigned la, bool i
>  	char osd_name[15];
>  	cec_ops_set_osd_name(&msg, osd_name);
>  	fail_on_test(!osd_name[0]);
> -	fail_on_test(strcmp(node->remote[la].osd_name, osd_name));
> +	fail_on_test(strcmp(node->remote[la].osd_name, osd_name) != 0);
>  	fail_on_test(msg.len != strlen(osd_name) + 2);
>  
>  	return 0;
> @@ -937,11 +937,11 @@ static int tuner_ctl_test(struct node *node, unsigned me, unsigned la, bool inte
>  		fail_on_test(timed_out_or_abort(&msg));
>  		info = {};
>  		cec_ops_tuner_device_status(&msg, &info);
> -		if (memcmp(&info, &(*iter), sizeof(info))) {
> +		if (memcmp(&info, &(*iter), sizeof(info)) != 0) {
>  			log_tuner_service(info);
>  			log_tuner_service(*iter);
>  		}
> -		fail_on_test(memcmp(&info, &(*iter), sizeof(info)));
> +		fail_on_test(memcmp(&info, &(*iter), sizeof(info)) != 0);
>  	}
>  	printf("\t    Finished Channel Test\n");
>  
> diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
> index 3495883e..be37ae3c 100644
> --- a/utils/cec-ctl/cec-ctl.cpp
> +++ b/utils/cec-ctl/cec-ctl.cpp
> @@ -975,7 +975,7 @@ static void analyze(const char *analyze_pin)
>  		exit(1);
>  	}
>  	if (!fgets(s, sizeof(s), fanalyze) ||
> -	    strcmp(s, "# cec-ctl --store-pin\n"))
> +	    strcmp(s, "# cec-ctl --store-pin\n") != 0)
>  		goto err;
>  	line++;
>  	if (!fgets(s, sizeof(s), fanalyze) ||
> diff --git a/utils/common/media-info.cpp b/utils/common/media-info.cpp
> index a5b429a0..b0f0bc41 100644
> --- a/utils/common/media-info.cpp
> +++ b/utils/common/media-info.cpp
> @@ -187,7 +187,7 @@ std::string mi_get_devpath_from_dev_t(dev_t dev)
>  		if (bytes <= 0)
>  			break;
>  		line[bytes - 1] = 0;
> -		if (memcmp(line, "DEVNAME=", 8) || !line[8])
> +		if ((memcmp(line, "DEVNAME=", 8) != 0) || !line[8])
>  			continue;
>  		devpath = "/dev/";
>  		devpath += line + 8;
> @@ -229,7 +229,7 @@ int mi_get_media_fd(int fd, const char *bus_info)
>  
>  			if (bus_info &&
>  			    (ioctl(media_fd, MEDIA_IOC_DEVICE_INFO, &mdinfo) ||
> -			     strcmp(mdinfo.bus_info, bus_info))) {
> +			     (strcmp(mdinfo.bus_info, bus_info) != 0))) {
>  				close(media_fd);
>  				continue;
>  			}
> diff --git a/utils/dvb/dvbv5-daemon.c b/utils/dvb/dvbv5-daemon.c
> index ad1197b7..a17233b2 100644
> --- a/utils/dvb/dvbv5-daemon.c
> +++ b/utils/dvb/dvbv5-daemon.c
> @@ -1203,7 +1203,7 @@ static int dev_set_parms(uint32_t seq, char *cmd, int fd,
>  
>  	if (!*new_lnb) {
>  		par->lnb = NULL;
> -	} else if (strcmp(old_lnb, new_lnb)) {
> +	} else if (strcmp(old_lnb, new_lnb) != 0) {
>  		int lnb = dvb_sat_search_lnb(new_lnb);
>  
>  		if (lnb < 0) {
> diff --git a/utils/dvb/dvbv5-scan.c b/utils/dvb/dvbv5-scan.c
> index 0a522433..30f8385f 100644
> --- a/utils/dvb/dvbv5-scan.c
> +++ b/utils/dvb/dvbv5-scan.c
> @@ -288,7 +288,7 @@ static int run_scan(struct arguments *args, struct dvb_device *dvb)
>  		 * to avoid linear search of LNB types for every entries.
>  		 */
>  		if (!args->lnb_name && entry->lnb &&
> -		    (!parms->lnb || strcasecmp(entry->lnb, parms->lnb->alias)))
> +		    (!parms->lnb || strcasecmp(entry->lnb, parms->lnb->alias) != 0))
>  			parms->lnb = dvb_sat_get_lnb(dvb_sat_search_lnb(entry->lnb));
>  
>  		/*
> diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
> index ba454619..9f8c1c5d 100644
> --- a/utils/ir-ctl/ir-ctl.c
> +++ b/utils/ir-ctl/ir-ctl.c
> @@ -739,7 +739,7 @@ static struct send* convert_keycode(struct keymap *map, const char *keycode)
>  		struct raw_entry *re;
>  
>  		for (re = map->raw; re; re = re->next) {
> -			if (strcmp(re->keycode, keycode))
> +			if (strcmp(re->keycode, keycode) != 0)
>  				continue;
>  
>  			count++;
> @@ -760,7 +760,7 @@ static struct send* convert_keycode(struct keymap *map, const char *keycode)
>  			const char *proto_str;
>  			enum rc_proto proto;
>  
> -			if (strcmp(se->keycode, keycode))
> +			if (strcmp(se->keycode, keycode) != 0)
>  				continue;
>  
>  			count++;
> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> index 4db91267..2c76f52b 100644
> --- a/utils/keytable/keytable.c
> +++ b/utils/keytable/keytable.c
> @@ -360,7 +360,7 @@ static void add_bpf_protocol(struct bpf_protocol *new)
>  	struct bpf_protocol *a;
>  
>  	for (a = bpf_protocol; a; a = a->next) {
> -		if (strcmp(a->name, new->name))
> +		if (strcmp(a->name, new->name) != 0)
>  			continue;
>  
>  		if (compare_parameters(a->param, new->param) &&
> @@ -2075,9 +2075,9 @@ int main(int argc, char *argv[])
>  		int matches = 0;
>  
>  		for (cur = &cfg; cur->next; cur = cur->next) {
> -			if ((!rc_dev.drv_name || strcasecmp(cur->driver, rc_dev.drv_name)) && strcasecmp(cur->driver, "*"))
> +			if ((!rc_dev.drv_name || strcasecmp(cur->driver, rc_dev.drv_name) != 0) && strcasecmp(cur->driver, "*") != 0)
>  				continue;
> -			if ((!rc_dev.keytable_name || strcasecmp(cur->table, rc_dev.keytable_name)) && strcasecmp(cur->table, "*"))
> +			if ((!rc_dev.keytable_name || strcasecmp(cur->table, rc_dev.keytable_name) != 0) && strcasecmp(cur->table, "*") != 0)
>  				continue;
>  
>  			if (debug)
> diff --git a/utils/libmedia_dev/get_media_devices.c b/utils/libmedia_dev/get_media_devices.c
> index 491a94da..462b8b97 100644
> --- a/utils/libmedia_dev/get_media_devices.c
> +++ b/utils/libmedia_dev/get_media_devices.c
> @@ -431,7 +431,7 @@ void display_media_devices(void *opaque)
>  	char *prev = "";
>  
>  	for (i = 0; i < md->md_size; i++) {
> -		if (strcmp(prev, md_ptr->device)) {
> +		if (strcmp(prev, md_ptr->device) != 0) {
>  			printf("\nDevice %s:\n\t", md_ptr->device);
>  			prev = md_ptr->device;
>  		}
> @@ -584,7 +584,7 @@ const char *get_not_associated_device(void *opaque,
>  		}
>  		if (last_seek && !found)
>  			continue;
> -		if (strcmp(prev, md_ptr->device)) {
> +		if (strcmp(prev, md_ptr->device) != 0) {
>  			if (!skip && result)
>  				break;
>  			prev = md_ptr->device;
> diff --git a/utils/media-ctl/libmediactl.c b/utils/media-ctl/libmediactl.c
> index 1fd6525b..6ef9a3f5 100644
> --- a/utils/media-ctl/libmediactl.c
> +++ b/utils/media-ctl/libmediactl.c
> @@ -475,7 +475,7 @@ static int media_get_devname_sysfs(struct media_entity *entity)
>  	if (strstr(p + 1, "dvb")) {
>  		char *s = p + 1;
>  
> -		if (strncmp(s, "dvb", 3))
> +		if (strncmp(s, "dvb", 3) != 0)
>  			return -EINVAL;
>  		s += 3;
>  		p = strchr(s, '.');
> diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
> index 0d0afbe7..3b4490aa 100644
> --- a/utils/media-ctl/libv4l2subdev.c
> +++ b/utils/media-ctl/libv4l2subdev.c
> @@ -433,7 +433,7 @@ static bool strhazit(const char *str, const char **p)
>  {
>  	int len = strlen(str);
>  
> -	if (strncmp(str, *p, len))
> +	if (strncmp(str, *p, len) != 0)
>  		return false;
>  
>  	for (*p += len; isspace(**p); ++*p);
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 938c7c35..0c3af294 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -620,14 +620,14 @@ static int testCap(struct node *node)
>  	fail_on_test(check_ustring(vcap.card, sizeof(vcap.card)));
>  	fail_on_test(check_ustring(vcap.bus_info, sizeof(vcap.bus_info)));
>  	// Check for valid prefixes
> -	if (memcmp(vcap.bus_info, "usb-", 4) &&
> -	    memcmp(vcap.bus_info, "PCI:", 4) &&
> -	    memcmp(vcap.bus_info, "PCIe:", 5) &&
> -	    memcmp(vcap.bus_info, "ISA:", 4) &&
> -	    memcmp(vcap.bus_info, "I2C:", 4) &&
> -	    memcmp(vcap.bus_info, "parport", 7) &&
> -	    memcmp(vcap.bus_info, "platform:", 9) &&
> -	    memcmp(vcap.bus_info, "rmi4:", 5))
> +	if (memcmp(vcap.bus_info, "usb-", 4) != 0 &&
> +	    memcmp(vcap.bus_info, "PCI:", 4) != 0 &&
> +	    memcmp(vcap.bus_info, "PCIe:", 5) != 0 &&
> +	    memcmp(vcap.bus_info, "ISA:", 4) != 0 &&
> +	    memcmp(vcap.bus_info, "I2C:", 4) != 0 &&
> +	    memcmp(vcap.bus_info, "parport", 7) != 0 &&
> +	    memcmp(vcap.bus_info, "platform:", 9) != 0 &&
> +	    memcmp(vcap.bus_info, "rmi4:", 5) != 0)
>  		return fail("missing bus_info prefix ('%s')\n", vcap.bus_info);
>  	if (!node->media_bus_info.empty() &&
>  	    node->media_bus_info != std::string(reinterpret_cast<const char *>(vcap.bus_info)))
> @@ -834,7 +834,7 @@ static int open_media_bus_info(const std::string &bus_info, std::string &media_d
>  	while ((ep = readdir(dp))) {
>  		const char *name = ep->d_name;
>  
> -		if (!memcmp(name, "media", 5) && isdigit(name[5])) {
> +		if ((!memcmp(name, "media", 5) != 0) && isdigit(name[5])) {
>  			struct media_device_info mdi;
>  			media_devname = std::string("/dev/") + name;
>  
> diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> index 3b45711d..004de314 100644
> --- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
> @@ -1011,7 +1011,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
>  					     (orig_buf.flags & valid_output_flags));
>  				if (buf.g_flags() & V4L2_BUF_FLAG_TIMECODE)
>  					fail_on_test(memcmp(&buf.g_timecode(), &orig_buf.timecode,
> -								sizeof(orig_buf.timecode)));
> +								sizeof(orig_buf.timecode)) != 0);
>  			}
>  			fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
>  
> @@ -1085,7 +1085,7 @@ static int captureBufs(struct node *node, struct node *node_m2m_cap, const cv4l_
>  					(orig_buf.flags & valid_output_flags));
>  			if (buf.g_flags() & V4L2_BUF_FLAG_TIMECODE)
>  				fail_on_test(memcmp(&buf.g_timecode(), &orig_buf.timecode,
> -							sizeof(orig_buf.timecode)));
> +							sizeof(orig_buf.timecode)) != 0);
>  		}
>  		fail_on_test(buf.g_flags() & V4L2_BUF_FLAG_DONE);
>  		if (!count || stopped) {
> diff --git a/utils/v4l2-compliance/v4l2-test-media.cpp b/utils/v4l2-compliance/v4l2-test-media.cpp
> index bcd8a725..bcba3b15 100644
> --- a/utils/v4l2-compliance/v4l2-test-media.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-media.cpp
> @@ -53,14 +53,14 @@ int testMediaDeviceInfo(struct node *node)
>  	} else {
>  		fail_on_test(check_string(mdinfo.bus_info, sizeof(mdinfo.bus_info)));
>  		// Check for valid prefixes
> -		if (memcmp(mdinfo.bus_info, "usb-", 4) &&
> -		    memcmp(mdinfo.bus_info, "PCI:", 4) &&
> -		    memcmp(mdinfo.bus_info, "PCIe:", 5) &&
> -		    memcmp(mdinfo.bus_info, "ISA:", 4) &&
> -		    memcmp(mdinfo.bus_info, "I2C:", 4) &&
> -		    memcmp(mdinfo.bus_info, "parport", 7) &&
> -		    memcmp(mdinfo.bus_info, "platform:", 9) &&
> -		    memcmp(mdinfo.bus_info, "rmi4:", 5))
> +		if (memcmp(mdinfo.bus_info, "usb-", 4) != 0 &&
> +		    memcmp(mdinfo.bus_info, "PCI:", 4) != 0 &&
> +		    memcmp(mdinfo.bus_info, "PCIe:", 5) != 0 &&
> +		    memcmp(mdinfo.bus_info, "ISA:", 4) != 0 &&
> +		    memcmp(mdinfo.bus_info, "I2C:", 4) != 0 &&
> +		    memcmp(mdinfo.bus_info, "parport", 7) != 0 &&
> +		    memcmp(mdinfo.bus_info, "platform:", 9) != 0 &&
> +		    memcmp(mdinfo.bus_info, "rmi4:", 5) != 0)
>  			return fail("missing bus_info prefix ('%s')\n", mdinfo.bus_info);
>  	}
>  	fail_on_test(mdinfo.media_version == 0);
> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> index 489639fb..998f63be 100644
> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> @@ -433,7 +433,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
>  	fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
>  	fail_on_test(crop.which != which);
>  	fail_on_test(crop.pad != pad);
> -	fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
> +	fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)) != 0);
>  
>  	for (unsigned tgt = 0; targets[tgt].target != ~0U; tgt++) {
>  		targets[tgt].found = false;
> @@ -476,7 +476,7 @@ int testSubDevSelection(struct node *node, unsigned which, unsigned pad)
>  				fail_on_test(check_0(crop.reserved, sizeof(crop.reserved)));
>  				fail_on_test(crop.which != which);
>  				fail_on_test(crop.pad != pad);
> -				fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)));
> +				fail_on_test(memcmp(&crop.rect, &sel.r, sizeof(sel.r)) != 0);
>  			}
>  		}
>  		fail_on_test(!ret && targets[tgt].readonly);
> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index f2997951..5dde39b9 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -190,7 +190,7 @@ static void list_media_devices(const std::string &media_bus_info)
>  		std::string s("/dev/");
>  
>  		s += ep->d_name;
> -		if (memcmp(ep->d_name, "media", 5)) {
> +		if (memcmp(ep->d_name, "media", 5) != 0) {
>  			if (!is_v4l_dev(ep->d_name))
>  				continue;
>  			struct stat st;
> 

